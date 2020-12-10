using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Gun : MonoBehaviour
{   
    //Shooting
    [SerializeField] enum FireMode {_Burst, _Single, _Auto}
    [SerializeField] FireMode _fireMode;
    int _burstCount = 3;
    int _shotsRemaingingInBurst;
    [SerializeField] Transform[] _muzzles;
    [SerializeField] Projectile _projectile;
    float _muzzleVelocity = 90f;
    public float nextShotTime = 2;
    [SerializeField]float _smoothTime = 5;
    [SerializeField] float shotTime = 2;
    Vector3 _recoilSmotherDampVel;
    Vector3 _vel;
    bool _triggerReleasedSinceLastShot;
    bool canFire;
    Crosshairs crosshair;
    Quaternion rotation;
    //recoil
    Player _player;

    //Reloading
    [SerializeField]int _projectilesPerMag;
    int _projectilesRemainingInMag;
    [HideInInspector] public bool isReloading;
    [SerializeField]float _reloadTime;
    [SerializeField] Transform _bolt;

    //shellEjection
    [SerializeField] Transform _shell;
    [SerializeField] Transform _shellEjection;

    //muzzleFlash
    Muzzleflash _muzzleFlash;


    void Start()
    {
        crosshair = FindObjectOfType<Crosshairs>();
        _shotsRemaingingInBurst = _burstCount;
        _muzzleFlash = GetComponent<Muzzleflash>();
        _player = FindObjectOfType<Player>();
        _projectilesRemainingInMag = _projectilesPerMag;
    }
    private void LateUpdate()
    {
        transform.localPosition = Vector3.SmoothDamp(transform.localPosition, Vector3.zero, ref _recoilSmotherDampVel, .3f);
        _bolt.localPosition = Vector3.SmoothDamp(_bolt.localPosition, new Vector3(.387f, -.008f, -.444f), ref _vel, .1f);
    }
    private void Update()
    {
        if(!isReloading && _projectilesRemainingInMag <= 0)
        {
            canFire = false;
        }
        else
        {
            canFire = true;
        }
        if (nextShotTime >= 0)
        {
            nextShotTime -= Time.deltaTime;
        }
    }
    public void Aim(Vector3 point)
    {
        Vector3 direction = point - _player.transform.position;
        Quaternion rotation = Quaternion.LookRotation(direction.normalized);
        transform.rotation = Quaternion.Lerp(transform.rotation, rotation, _smoothTime * Time.deltaTime);
    }
    void Shoot(float recoilStrength)
    {
        if (!isReloading && nextShotTime <= 0 && _projectilesRemainingInMag > 0)
        {
            if(_fireMode == FireMode._Burst)
            {
                if(_shotsRemaingingInBurst == 0)
                {
                    return;
                }
                _shotsRemaingingInBurst--;
            }
            else if (_fireMode == FireMode._Single)
            {
                if(!_triggerReleasedSinceLastShot)
                {
                    return;
                }
            }
            for(int i = 0; i < _muzzles.Length; i++)
            {
                nextShotTime = shotTime;
                Projectile newProjectile = Instantiate(_projectile, _muzzles[i].position, Quaternion.identity) as Projectile;
                newProjectile.GetComponent<Rigidbody>().velocity = _muzzles[i].transform.forward * _muzzleVelocity;
            }
            DrawBackBolt();
            _projectilesRemainingInMag--;
            Instantiate(_shell, _shellEjection.position, _shellEjection.rotation);
            _muzzleFlash.Activate();
            transform.localPosition -= new Vector3(.5f,0,.5f) * Random.Range(.7f, 1);
            _player.rb.velocity = Vector3.Lerp(_player.rb.velocity, _player.rb.velocity - (_muzzles[0].transform.position - transform.position) * recoilStrength, 1f);
        }
    }

    public void Reload()
    {
        if(_projectilesRemainingInMag != _projectilesPerMag)
        {
            StartCoroutine(AnimateReload());
        }
    }
    void DrawBackBolt()
    {
        StartCoroutine(AnimateBolt());
    }
    IEnumerator AnimateReload()
    {
        isReloading = true;
        yield return new WaitForSeconds(.2f);

        float reloadSpeed = 1 / _reloadTime;
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
        _projectilesRemainingInMag = _projectilesPerMag;
    }
    IEnumerator AnimateBolt()
    {
        yield return new WaitForSeconds(.2f);
        float reloadSpeed = 1 / _reloadTime;
        float percent = 0;
        float maxDrawBack = .03f;

        while (percent < 1)
        {
            percent += Time.deltaTime * reloadSpeed;
            float interpolation = (-Mathf.Pow(percent, 2) + percent) * 4;
            float drawBack = Mathf.Lerp(0, maxDrawBack, interpolation);
            _bolt.localPosition = _bolt.localPosition - Vector3.right * drawBack;

            yield return null;
        }
    }

    public void OnTriggerHold(float maxRecoil, float recoilStrength)
    {
        if(canFire)
        {
            Shoot(recoilStrength);
        }

        _triggerReleasedSinceLastShot = false;
    }
    public void OnTriggerRelease()
    {
        _triggerReleasedSinceLastShot = true;
        _shotsRemaingingInBurst = _burstCount;
    }
}
