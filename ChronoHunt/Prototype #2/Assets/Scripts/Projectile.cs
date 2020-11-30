using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Projectile : MonoBehaviour
{
    public LayerMask collisionMask;
    float _speed = 10f;
    float _damage = 1;
    float _lifeTime = 3;
    float _skinWidth = .1f;
    public Color trailColor;

    public void SetSpeed (float newSpeed)
    {
        _speed = newSpeed;
    }
    private void Start()
    {
        Destroy(gameObject, _lifeTime);
        //GetComponent<TrailRenderer>().material.SetColor("_TintColor", trailColor);
        Collider[] initialCollisions = Physics.OverlapSphere(transform.position, .1f, collisionMask);
        if (initialCollisions.Length > 0)
        {
            OnHitObject(initialCollisions[0], transform.position);
        }
    }

    void Update()
    {
        float moveDistance = _speed * Time.deltaTime;
        CheckCollisions(moveDistance);
        transform.Translate(Vector3.forward * moveDistance);
    }

    void CheckCollisions (float moveDistance)
    {
        Ray ray = new Ray(transform.position, transform.forward);
        RaycastHit hit;

        if (Physics.Raycast(ray, out hit, moveDistance + _skinWidth, collisionMask, QueryTriggerInteraction.Collide))
        {
            OnHitObject(hit.collider, hit.point);
        }
    }

    void OnHitObject(Collider c, Vector3 hitPoint)
    {
        IDamagable damagableObgect = c.GetComponent<IDamagable>();
        if (damagableObgect != null)
        {
            damagableObgect.TakeHit(_damage, hitPoint, transform.forward);
        }
        GameObject.Destroy(gameObject);
    }
}
