﻿using System.Collections;
using System.Collections.Generic;
using TreeEditor;
using UnityEngine;

public class Gun : MonoBehaviour
{
    public Transform muzzle;
    public Projectile projectile;
    public float msBetweenShots = 100;
    public float muzzleVelocity = 35f;
    float nextShotTime;
    Vector3 smoothDampRecoil;
    Player player;
    public float smoothTime;
    public float recoilStrength;
    public float maxRecoil;

    void Start()
    {
        player = FindObjectOfType<Player>();
    }
    void FixedUpdate()
    {
        transform.localPosition = Vector3.zero;
        if (Input.GetKey(KeyCode.LeftShift))
        {
            recoilStrength = 4;
        }
        else
        {
            recoilStrength = maxRecoil;
        }
    }
    public void Aim(Vector3 point)
    {
        Vector3 direction = point - player.transform.position;
        Quaternion rotation = Quaternion.LookRotation(direction);
        transform.rotation = Quaternion.Lerp(transform.rotation, rotation, smoothTime * Time.deltaTime);
    }
    public void Shoot()
    {
        if (Time.time > nextShotTime)
        {
            nextShotTime = Time.time + msBetweenShots / 1000;
            Projectile newProjectile = Instantiate(projectile, muzzle.position, muzzle.rotation) as Projectile;
            newProjectile.SetSpeed(muzzleVelocity);
            transform.localPosition -= Vector3.forward * .01f;
            //player.transform.position =  Vector3.Lerp(player.transform.position, player.transform.position - (muzzle.position - transform.position) * 3, 10f);
            player.rb.velocity = Vector3.Slerp(player.rb.velocity, player.rb.velocity - (muzzle.transform.position - transform.position) * recoilStrength, 1f);
        }
    }
}