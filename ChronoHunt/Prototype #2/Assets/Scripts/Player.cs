using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(GunController))]
public class Player : LivingEntity
{
    float _interactDistance = 5;
    float _outerInteractDistance = 20;
    float _maxRayDistance = 20f;
    [SerializeField] LayerMask _interactables;
    [SerializeField] LayerMask _enemies;
    [SerializeField] LayerMask _layerMask;
    int _maxtargets = 5;
    Camera _viewCamera;
    PlayerController _controller;
    GunController _gunController;
    AwarenessScript _eyes;
    [HideInInspector] public Rigidbody rb;
    [SerializeField] Crosshairs _crosshair;
    [SerializeField] Animator _playerAnim;
    Vector3 _point;
    protected override void Start()
    {
        base.Start();
        rb = GetComponent<Rigidbody>();
        _eyes = GetComponent<AwarenessScript>();
        _controller = GetComponent<PlayerController>();
        _viewCamera = Camera.main;
        _gunController = GetComponent<GunController>();
    }

    void FixedUpdate()
    {
        //Movement input
        _controller.Move();
    }

    void Update()
    {
        //Movement checks
        _controller.CalculateDirection();
        _controller.CalculateForward();
        _controller.CalculateGroundAngle();
        _controller.SetRotation();

        //set animations
        _playerAnim.SetBool("Running", _controller.running);
        _playerAnim.SetFloat("WalkVelX", _controller.walkVelocity.x);
        _playerAnim.SetFloat("WalkVelY", _controller.walkVelocity.y);

        //Interactable detection
        _eyes.DetectInteractables(_interactDistance,_outerInteractDistance, _interactables, _maxtargets);
        Vector2 mouseScreenPosition = Input.mousePosition;
        //mouseScreenPosition = new Vector3(mouseScreenPosition.x,mouseScreenPosition.y, 0) - transform.position;
        Ray ray = _viewCamera.ScreenPointToRay(mouseScreenPosition);
        RaycastHit hit;
        if (Input.GetMouseButtonDown(0))
        {
            _controller.CreateRay();
        }


        if (_controller.isLockedOn)
        {
            if (_controller.target != null)
            {
               //reticle changes
            }
            else 
            {
                _controller.isLockedOn = false;
            }
        }
        
        if (Physics.Raycast(ray, out hit, _maxRayDistance, _layerMask))
        {
            _point = hit.point;
            _crosshair.DetectTargets(ray);
        }
        else
        {
            _point = ray.origin + ray.direction * _maxRayDistance;
        }
        Debug.DrawLine(ray.origin, _point, Color.red);
        _crosshair.transform.position = _point;
        if ((new Vector3(_point.x, _point.z) - new Vector3(transform.position.x, transform.position.z)).sqrMagnitude > .2f)
        {
            _gunController.Aim(_point);
        }
        //Weapon 
        if (!_gunController.isReloading && Input.GetKeyDown(KeyCode.R))
        {
            _gunController.Reload();
        }
        if (Input.GetKey(KeyCode.LeftShift))
        {
            _gunController.recoilStrength = 4;
        }
        else
        {
            _gunController.recoilStrength = _gunController.maxRecoil;
        }
        if (Input.GetMouseButton(0))
        {
            _gunController.OnTriggerHold();
        }
        if(Input.GetMouseButtonUp(0))
        {
            _gunController.OnTriggerRelease();
        }
    }
}