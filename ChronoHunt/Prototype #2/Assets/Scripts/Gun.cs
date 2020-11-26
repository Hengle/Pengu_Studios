using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Gun : MonoBehaviour
{
    [SerializeField] Transform muzzle;
    [SerializeField] Projectile projectile;
    float muzzleVelocity = 50f;
    public float nextShotTime = 2;
    Player player;
    [SerializeField]float smoothTime = 5;
    float recoilStrength = 11;
    float maxRecoil = 11;
    public float shotTime = 2;
    [SerializeField] Rigidbody rb;
    Vector3 recoilSmotherDampVel;

    //Reloading
    [SerializeField]int projectilesPerMag;
    int projectilesRemainingInMag;
    bool isReloading;
    [SerializeField]float reloadTime;


    void Start()
    {
        player = FindObjectOfType<Player>();
        projectilesRemainingInMag = projectilesPerMag;
    }
    private void LateUpdate()
    {
        transform.localPosition = Vector3.SmoothDamp(transform.localPosition, Vector3.zero, ref recoilSmotherDampVel, .05f);
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
    public void Shoot()
    {
        if (!isReloading && nextShotTime <= 0 && projectilesRemainingInMag > 0)
        {
            projectilesRemainingInMag--;
            nextShotTime = shotTime;
            Projectile newProjectile = Instantiate(projectile, muzzle.position, muzzle.rotation) as Projectile;
            newProjectile.SetSpeed(muzzleVelocity);
            transform.localPosition -= Vector3.left * Random.Range(.5f, 1);
            player.rb.velocity = Vector3.Lerp(player.rb.velocity, player.rb.velocity - (muzzle.transform.position - transform.position) * recoilStrength, 1f);
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
        float maxReloadAngle = 30;

        while(percent < 1)
        {
            percent += Time.deltaTime * reloadSpeed;
            float interpolation = (-Mathf.Pow(percent, 2) + percent) * 4;
            float reloadAngle = Mathf.Lerp(0, maxReloadAngle, interpolation);
            transform.localEulerAngles = initialRot + Vector3.forward * reloadAngle;

            yield return null;
        }
        isReloading = false;
        projectilesRemainingInMag = projectilesPerMag;
    }

}
