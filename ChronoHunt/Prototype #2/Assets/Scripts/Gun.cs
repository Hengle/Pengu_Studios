using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Gun : MonoBehaviour
{   
    //Shooting
    [SerializeField] enum FireMode {Burst, Single, Auto}
    [SerializeField] FireMode fireMode;
    int burstCount = 3;
    int shotsRemaingingInBurst;
    [SerializeField] Transform[] muzzles;
    [SerializeField] Projectile projectile;
    float muzzleVelocity = 50f;
    public float nextShotTime = 2;
    [SerializeField]float smoothTime = 5;
    public float shotTime = 2;
    Vector3 recoilSmotherDampVel;
    Vector3 vel;
    bool triggerReleasedSinceLastShot;

    //recoil
    float recoilStrength = 11;
    float maxRecoil = 11;
    Player player;

    //Reloading
    [SerializeField]int projectilesPerMag;
    int projectilesRemainingInMag;
    bool isReloading;
    [SerializeField]float reloadTime;
    [SerializeField] Transform bolt;

    //shellEjection
    [SerializeField] Transform shell;
    [SerializeField] Transform shellEjection;

    //muzzleFlash
    Muzzleflash muzzleFlash;


    void Start()
    {
        shotsRemaingingInBurst = burstCount;
        muzzleFlash = GetComponent<Muzzleflash>();
        player = FindObjectOfType<Player>();
        projectilesRemainingInMag = projectilesPerMag;
    }
    private void LateUpdate()
    {
        transform.localPosition = Vector3.SmoothDamp(transform.localPosition, Vector3.zero, ref recoilSmotherDampVel, .3f);
        bolt.localPosition = Vector3.SmoothDamp(bolt.localPosition, new Vector3(.387f, -.008f, -.444f), ref vel, .1f);
    }
    private void Update()
    {
        if (!isReloading && projectilesRemainingInMag == 0)
        {
            Reload();
        }
        if (nextShotTime >= 0)
        {
            nextShotTime -= Time.deltaTime;
        }
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
        Quaternion rotation = Quaternion.LookRotation(direction.normalized);
        transform.rotation = Quaternion.Lerp(transform.rotation, rotation, smoothTime * Time.deltaTime);
    }
    void Shoot()
    {
        if (!isReloading && nextShotTime <= 0 && projectilesRemainingInMag > 0)
        {
            if(fireMode == FireMode.Burst)
            {
                if(shotsRemaingingInBurst == 0)
                {
                    return;
                }
                shotsRemaingingInBurst--;
            }
            else if (fireMode == FireMode.Single)
            {
                if(!triggerReleasedSinceLastShot)
                {
                    return;
                }
            }
            for(int i = 0; i < muzzles.Length; i++)
            {
                nextShotTime = shotTime;
                Projectile newProjectile = Instantiate(projectile, muzzles[i].position, muzzles[i].rotation) as Projectile;
                newProjectile.SetSpeed(muzzleVelocity);
            }
            projectilesRemainingInMag--;
            Instantiate(shell, shellEjection.position, shellEjection.rotation);
            muzzleFlash.Activate();
            transform.localPosition -= new Vector3(.5f,0,.5f) * Random.Range(.7f, 1);
            player.rb.velocity = Vector3.Lerp(player.rb.velocity, player.rb.velocity - (muzzles[1].transform.position - transform.position) * recoilStrength, 1f);
        }
    }

    public void Reload()
    {
        StartCoroutine(AnimateReload());
    }
    IEnumerator AnimateReload()
    {
        isReloading = true;
        yield return new WaitForSeconds(.2f);

        float reloadSpeed = 1 / reloadTime;
        float percent = 0;
        Vector3 initialRot = transform.localEulerAngles;
        float maxReloadAngle = 10;
        float maxDrawBack = .07f;

        while(percent < 1)
        {
            percent += Time.deltaTime * reloadSpeed;
            float interpolation = (-Mathf.Pow(percent, 2) + percent) * 4;
            float reloadAngle = Mathf.Lerp(0, maxReloadAngle, interpolation);
            float drawBack = Mathf.Lerp(0, maxDrawBack, interpolation);
            bolt.localPosition = bolt.localPosition - Vector3.right * drawBack;
            transform.localEulerAngles = initialRot + Vector3.forward * reloadAngle;

            yield return null;
        }
        isReloading = false;
        projectilesRemainingInMag = projectilesPerMag;
    }

    public void OnTriggerHold()
    {
        Shoot();
        triggerReleasedSinceLastShot = false;
    }
    public void OnTriggerRelease()
    {
        triggerReleasedSinceLastShot = true;
        shotsRemaingingInBurst = burstCount;
    }
}
