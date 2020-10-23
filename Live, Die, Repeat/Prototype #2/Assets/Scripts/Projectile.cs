using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Projectile : MonoBehaviour
{
    public LayerMask collisionMask;
    float speed = 10f;
    float damage = 1;
    Cinemachine.CinemachineImpulseSource source;

    public void SetSpeed (float newSpeed)
    {
        speed = newSpeed;
    }
    private void Start()
    {
        source = GetComponent<Cinemachine.CinemachineImpulseSource>();
        Destroy(this.gameObject, 2f);
        source.GenerateImpulse(transform.forward);
    }

    void Update()
    {
        float moveDistance = speed * Time.deltaTime;
        CheckCollisions(moveDistance);
        transform.Translate(Vector3.forward * moveDistance);
    }

    void CheckCollisions (float moveDistance)
    {
        Ray ray = new Ray(transform.position, transform.forward);
        RaycastHit hit;

        if (Physics.Raycast(ray, out hit, moveDistance, collisionMask, QueryTriggerInteraction.Collide))
        {
            OnHitObject(hit);
        }
    }

    void OnHitObject (RaycastHit hit)
    {
        IDamagable damagableObgect = hit.collider.GetComponent<IDamagable>();
        if (damagableObgect != null)
        {
            damagableObgect.TakeHit(damage, hit);
        }
        GameObject.Destroy(gameObject);
    }
}
