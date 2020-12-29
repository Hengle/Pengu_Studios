using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(GunController))]
public class Player : LivingEntity
{
    float _interactDistance = 5;
    float _outerInteractDistance = 20;
    float _maxRayDistance = 30f;
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
    [SerializeField]Gun startingGun;
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
        if(_controller.canMove)
        {
            _controller.Move();
        }
    }

    void Update()
    {
        //Movement checks
        _controller.CalculateDirection();
        _controller.SetRotation();

        //PlayerController Input
        _controller.ReadInput();
        _controller.CheckGroundStatus();
        _controller.CheckForTurns();

        //set animations
        _playerAnim.SetBool("IsWalking", _controller.isWalking);
        _playerAnim.SetBool("Running", _controller.isRunning);
        _playerAnim.SetBool("Stopping", _controller.isStopping);
        _playerAnim.SetBool("Moving", _controller.isMoving);
        _playerAnim.SetBool("IsSliding", _controller.isSliding);
        _playerAnim.SetBool("IsDodging", _controller.isDodging);
        _playerAnim.SetBool("IsTurning", _controller.isTurning);
        _playerAnim.SetBool("HasDodged", _controller.hasDodged);
        _playerAnim.SetFloat("WalkVelX", _controller.walkVelocity.x);
        _playerAnim.SetFloat("WalkVelY", _controller.walkVelocity.y);

        //Interactable detection
        _eyes.DetectInteractables(_interactDistance,_outerInteractDistance, _interactables, _maxtargets);
        Vector2 mouseScreenPosition = Input.mousePosition;
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
                _gunController.Aim(_controller.target.transform.position);
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
        if ((new Vector3(_point.x, _point.z) - new Vector3(transform.position.x, transform.position.z)).sqrMagnitude > .2f && !_controller.isLockedOn)
        {
            _gunController.Aim(_point);
        }
        //Weapon 
        if (Input.GetKey(KeyCode.F))
        {
            _gunController.EquipGun(startingGun);
        }
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
        if (Input.GetMouseButtonUp(0))
        {
            _gunController.OnTriggerRelease();
        }

        //Running
        if (_controller.forwardVelocity == 0)
        {
            _controller.isMoving = false;
            _controller.isStopping = false;
            _controller.isRunning = false;
        }
        else
        {
            _controller.isMoving = true;
        }

        if (_controller.forwardVelocity <= (_controller.maxSpeed * .5f) && _controller.isRunning)
        {
            _controller.isRunning = false;
            _controller.isStopping = true;
        }
        //Sliding
        if(_controller.isSliding)
        {
            _controller.Slide();
        }
        //Dodging
        if(_controller.isDodging)
        {
            _controller.Dodge();
        }
    }
}