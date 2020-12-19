﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class PlayerController : MonoBehaviour
{
    //fine tune control variables
    public float maxSpeed = 10;
    float _timeZeroToMax = 1f;
    float _timeMaxToZero = .5f;
    float _timeSlideToZero = .7f;
    float _accelRatePerSecond;
    float _decelRatePerSecond;
    float _slideDecelRatePerSecond;
    float _maxInteractDistance = 30;
    //slide
    float _slidePercent;
    float _slideSpeed;
    bool _hasReturnedFromSlide;
    float _intitalHeight;
    float _heightChangeVertical = .5f;
    float _centerChangeVertical = -.39f;
    CapsuleCollider col;
    //Dodge
    [SerializeField] float _dodgeDistance;
    [SerializeField] float _dodgeTime;
    [SerializeField] float _dodgeHeight;
    public bool isDodging = false;
    //Camera Stuff
    [HideInInspector]public Vector3 walkVelocity;
    [SerializeField]float _turnSpeed = 15;
    float _angle;
    Quaternion _targetRotation;
    //groundChecks
    Vector3 _groundNormal;
    [SerializeField]float _height = 1f;
    [SerializeField]float _heightPadding = .05f;
    [SerializeField] LayerMask _ground;
    float _maxGroundAngle = 150;
    float _groundAngle;
    Vector3 _forward;
    RaycastHit _hitInfo;
    //gameobjects/components
    Camera _cam;
    [HideInInspector]public GameObject target;
    Rigidbody rb;
    //bools
    [HideInInspector] public bool isScopedIn = false;
    [HideInInspector] public bool isLockedOn = false;
    [HideInInspector]public bool canMove = true;
    //layermasks
    [SerializeField] LayerMask _enemy;
    //player state
    public float forwardVelocity;
    [HideInInspector] public bool isRunning;
    [HideInInspector] public bool isStopping;
    [HideInInspector] public bool isMoving;
    [HideInInspector] public bool isSliding;
    public bool isGrounded;
    void Start()
    {
        _slideSpeed = maxSpeed * .1f;
        rb = GetComponent<Rigidbody>();
        col = GetComponent<CapsuleCollider>();
        _intitalHeight = col.height;
        _groundNormal = Vector3.zero;
        isGrounded = true;
        _accelRatePerSecond = maxSpeed / _timeZeroToMax;
        _decelRatePerSecond = -maxSpeed / _timeMaxToZero;
        _slideDecelRatePerSecond = -maxSpeed / _timeSlideToZero;
        _cam = Camera.main;
    }
    public void ReadInput()
    {
        //movement
        Vector2 movement = new Vector3(Input.GetAxisRaw("Vertical"), Input.GetAxisRaw("Horizontal"), 0).normalized;
        // Takes input from the input manager
        if (canMove && isGrounded)
        {
            if (movement.x != 0)
            {
                Accelerate(_accelRatePerSecond);
                walkVelocity += Vector3.up * movement.x;
            }

            if (movement.y != 0)
            {
                Accelerate(_accelRatePerSecond);
                walkVelocity += Vector3.right * movement.y;
            }
        }
        //slide
        if(Input.GetKey(KeyCode.LeftShift) & !isSliding && forwardVelocity <= maxSpeed + 1)
        {
            isSliding = true;
            canMove = false;
            _slidePercent = 0f;
        }
        else if (Input.GetKeyUp(KeyCode.LeftShift))
        {
            _hasReturnedFromSlide = false;
            _slidePercent = 0;
        }
        //dodge
        if(Input.GetKeyDown(KeyCode.Space) && !isDodging && forwardVelocity >= maxSpeed - 1 && !isSliding)
        {
            isDodging = true;
        }
        walkVelocity = walkVelocity.normalized;
     }

    public void Move ()
    {
        if (_groundAngle >= _maxGroundAngle) return;
        if (Input.GetKey(KeyCode.W) || Input.GetKey(KeyCode.A) || Input.GetKey(KeyCode.S) || Input.GetKey(KeyCode.D))
        {
            transform.position += transform.forward * forwardVelocity * Time.fixedDeltaTime;
        }
        else
        {  
            Accelerate(_decelRatePerSecond);
            transform.position += transform.forward * forwardVelocity * Time.fixedDeltaTime;
        }
        
    }

    public void Slide()
    {   
        if(isGrounded)
        {
            while (_slidePercent < 1)
            {
                _slidePercent += Time.fixedDeltaTime / 10;
                Vector3 _newHeight = new Vector3(transform.localScale.x, transform.localScale.y - _heightChangeVertical, transform.localScale.z);
                col.height = _newHeight.y;
                col.center = new Vector3(col.center.x, _centerChangeVertical, col.center.z);
            }
            if (_slidePercent >= 1 && !_hasReturnedFromSlide)
            {
                StartCoroutine("ResetRotation");
            }
            Accelerate(_slideDecelRatePerSecond);
            transform.position += transform.forward * forwardVelocity * Time.fixedDeltaTime * _slideSpeed;
        }
    }
    public IEnumerator ResetRotation()
    {
        _hasReturnedFromSlide = true;
        yield return new WaitForSeconds(.1f);
        isSliding = false;
        canMove = true;
        float _returnPercent = 0;
        while (_returnPercent < 1)
        {
            _returnPercent += Time.fixedDeltaTime;
            col.height = _intitalHeight;
            col.center = new Vector3(col.center.x, .7236309f, col.center.z);
        }

    }

    public void Dodge()
    {
        if(isGrounded)
        {
            rb.velocity = Vector3.Lerp(rb.velocity, new Vector3(rb.transform.forward.x, rb.transform.forward.y + _dodgeHeight, rb.transform.forward.z) * _dodgeDistance, _dodgeTime);
            isDodging = false;
        }
    }
    public void Accelerate(float accel)
    {
        // increases and decreases the forwardvelocity float.
        forwardVelocity += accel * Time.fixedDeltaTime;
        forwardVelocity = Mathf.Clamp(forwardVelocity, 0, maxSpeed);
    }

    public void SetRotation()
    {
        _targetRotation = Quaternion.Euler(0, _angle, 0);
        transform.rotation = Quaternion.Slerp(transform.rotation, _targetRotation, _turnSpeed * Time.deltaTime);
    }
    public void CreateRay()
    {
        //Creates a ray to dectect if the player hit an enemy
        Ray ray = _cam.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, _maxInteractDistance, _enemy, QueryTriggerInteraction.Collide))
        {
            Debug.DrawLine(ray.origin, hit.point, Color.red);
            if (hit.collider.tag == ("Enemy"))
            {
                print("Hit");
                //isLockedOn = true;
                //target = hit.collider.gameObject;
            }
        }

    }
    public void CalculateDirection()
    {
        _angle = Mathf.Atan2(walkVelocity.x, walkVelocity.y);
        _angle = Mathf.Rad2Deg * _angle;
        _angle += _cam.transform.eulerAngles.y;
    }
    public void CheckGroundStatus()
    {
        
        Debug.DrawLine(transform.position, transform.position + _forward * _height * 2, Color.blue);
        Debug.DrawLine(transform.position, transform.position - Vector3.up * (_height + _heightPadding), Color.red);
        // 0.1f is a small offset to start the ray from inside the character
        if (Physics.Raycast(transform.position, -Vector3.up, out _hitInfo, _height + _heightPadding, _ground))
        {
            if(Vector3.Distance(transform.position, _hitInfo.point) > _height)
            {
                transform.position = Vector3.Lerp(transform.position, transform.position + Vector3.up * _height, 5 * Time.deltaTime);
            }
            isGrounded = true;
        }
        else
        {
            isGrounded = false;
        }
        
    }
    public void CalculateForward()
    {
        if(!isGrounded)
        {
            _forward = transform.forward;
        }

        _forward = Vector3.Cross(transform.right, _groundNormal);
    }
    public void CalculateGroundAngle()
    {
        if (!isGrounded)
        {
            _groundAngle = 90;
            return;
        }
        _groundAngle = Vector3.Angle(_groundNormal, transform.forward);
    }


}

