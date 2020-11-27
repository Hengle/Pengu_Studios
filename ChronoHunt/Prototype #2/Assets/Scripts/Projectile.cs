﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Projectile : MonoBehaviour
{
    public LayerMask collisionMask;
    float speed = 10f;
    float damage = 1;
    float lifeTime = 3;
    float skinWidth = .1f;
    public Color trailColor;

    public void SetSpeed (float newSpeed)
    {
        speed = newSpeed;
    }
    private void Start()
    {
        Destroy(gameObject, lifeTime);
        //GetComponent<TrailRenderer>().material.SetColor("_TintColor", trailColor);
        Collider[] initialCollisions = Physics.OverlapSphere(transform.position, .1f, collisionMask);
        if (initialCollisions.Length > 0)
        {
            OnHitObject(initialCollisions[0], transform.position);
        }
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

        if (Physics.Raycast(ray, out hit, moveDistance + skinWidth, collisionMask, QueryTriggerInteraction.Collide))
        {
            OnHitObject(hit.collider, hit.point);
        }
    }

    void OnHitObject(Collider c, Vector3 hitPoint)
    {
        IDamagable damagableObgect = c.GetComponent<IDamagable>();
        if (damagableObgect != null)
        {
            damagableObgect.TakeHit(damage, hitPoint, transform.forward);
        }
        GameObject.Destroy(gameObject);
    }
}
