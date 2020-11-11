using System.Collections;
using System.Collections.Generic;
using TreeEditor;
using UnityEngine;

public class Gun : MonoBehaviour
{
    public Transform muzzle;
    public Projectile projectile;
    float msBetweenShots = 2000;
    float muzzleVelocity = 50f;
    public float nextShotTime = 2;
    Player player;
    float smoothTime = 3;
    float recoilStrength = 10;
    float maxRecoil = 10;
    float displacement = .3f;
    float maxDisplacement;
    public float shotTime = 2;

    void Start()
    {
        player = FindObjectOfType<Player>();
        maxDisplacement = displacement;
    }
    void Update()
    {
        transform.localPosition = Vector3.zero;
        if (Input.GetKey(KeyCode.LeftShift))
        {
            recoilStrength = 4;
            displacement = 0;
        }
        else
        {
            recoilStrength = maxRecoil;
            displacement = maxDisplacement;
        }
    }
    void FixedUpdate()
    {
        if(nextShotTime >= 0)
        {
            nextShotTime -= Time.deltaTime;
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
        if (nextShotTime <= 0)
        {
            nextShotTime = shotTime;
            Projectile newProjectile = Instantiate(projectile, muzzle.position, muzzle.rotation) as Projectile;
            newProjectile.SetSpeed(muzzleVelocity);
            transform.localPosition -= Vector3.forward * .01f;
            player.transform.position = player.transform.position + new Vector3(0,displacement, 0);
            player.rb.velocity = Vector3.Lerp(player.rb.velocity, player.rb.velocity - (muzzle.transform.position - transform.position) * recoilStrength, 1f);
        }
    }
}
