using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GunController : MonoBehaviour
{
    public Transform weaponHold;
    public Gun startingGun;
    Gun equippedGun;
    [HideInInspector] public float shotTime;
    private void Start()
    {
        if (startingGun != null)
        {
            EquipGun(startingGun);
        }
    }
    public void EquipGun (Gun gunToEquip)
    {
        if(equippedGun != null)
        {
            Destroy(equippedGun.gameObject);
        }
        equippedGun = Instantiate(gunToEquip, weaponHold.position, weaponHold.rotation) as Gun;
        equippedGun.transform.parent = weaponHold;
    }

    public void Shoot()
    {
        if (equippedGun != null)
        {
            equippedGun.Shoot();
        }
    }

    public void Aim(Vector3 aimPoint)
    {
        shotTime = equippedGun.nextShotTime;
        if (equippedGun != null)
        {
            equippedGun.Aim(aimPoint);
        }
    }
    public void Reload()
    {
        if (equippedGun != null)
        {
            equippedGun.Reload();
        }
    }

}
