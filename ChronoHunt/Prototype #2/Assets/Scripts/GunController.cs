using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GunController : MonoBehaviour
{
    public Transform weaponHold;
    public Gun startingGun;
    Gun _equippedGun;
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
        if(_equippedGun != null)
        {
            Destroy(_equippedGun.gameObject);
        }
        _equippedGun = Instantiate(gunToEquip, weaponHold.position, weaponHold.rotation) as Gun;
        _equippedGun.transform.parent = weaponHold;
    }

    public void OnTriggerHold()
    {
        if (_equippedGun != null)
        {
            _equippedGun.OnTriggerHold();
        }
    }
    public void OnTriggerRelease()
    {
        if (_equippedGun != null)
        {
            _equippedGun.OnTriggerRelease();
        }
    }

    public void Aim(Vector3 aimPoint)
    {
        shotTime = _equippedGun.nextShotTime;
        if (_equippedGun != null)
        {
            _equippedGun.Aim(aimPoint);
        }
    }
    public void Reload()
    {
        if (_equippedGun != null)
        {
            _equippedGun.Reload();
        }
    }

}
