using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class PlayerController : Controller
{
    //fine tune control variables
    float _maxSpeed = 6;
    float _timeZeroToMax = .5f;
    float _timeMaxToZero = .5f;
    float _accelRatePerSecond;
    float _decelRatePerSecond;
    float _maxInteractDistance = 30;
    [HideInInspector]public Vector3 walkVelocity;
    [SerializeField]float _turnSpeed = 1;
    float _angle;
    Quaternion _targetRotation;
    //groundChecks
    Vector3 _groundNormal;
    public bool isGrounded;
    float _height = 1f;
    [SerializeField]float _heightPadding = .05f;
    [SerializeField] LayerMask _ground;
    float _maxGroundAngle = 120;
    float _groundAngle;
    Vector3 _forward;
    RaycastHit _hitInfo;
    //gameobjects/components
    Camera _cam;
    [HideInInspector]public GameObject target;
    //bools
    [HideInInspector]public bool isScopedIn = false;
    [HideInInspector]public bool isLockedOn = false;
    //layermasks
    [SerializeField] LayerMask _enemy;
    //player state
    [SerializeField]float _forwardVelocity;
    [HideInInspector] public bool running;
    bool _sliding;
    void Start()
    {
        _groundNormal = Vector3.zero;
        isGrounded = true;
        _accelRatePerSecond = _maxSpeed / _timeZeroToMax;
        _decelRatePerSecond = -_maxSpeed / _timeMaxToZero;
        _cam = Camera.main;
    }
    public override void ReadInput(InputData data)
    {
        // Takes input from the input manager
        if (data.axes[0] != 0)
        {
            Accelerate(_accelRatePerSecond);
            walkVelocity += Vector3.up * data.axes[0];
        }
        if (data.axes[1] != 0)
        {
            Accelerate(_accelRatePerSecond);
            walkVelocity += Vector3.right * data.axes[1];
        }
        if(data.buttons[0])
        {
            _sliding = true;
        }
        else
        {
            _sliding = false;
        }
        walkVelocity = walkVelocity.normalized;
        newInput = true;
    }

    private void Update()
    {
        if (_sliding)
        {
            _maxSpeed = 3;
        }
        else
        {
            _maxSpeed = 6;
        }
        if (_forwardVelocity >= 1)
        {
            running = true;
        }
        else if (_forwardVelocity <= 5)
        {
            running = false;
        }
    }

    public void CreateRay ()
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
    public void Move ()
    {
        // self explanatory....
        CheckGroundStatus();
        if(isGrounded)
        {
            if (_groundAngle >= _maxGroundAngle) return;
            if (newInput)
            {
                transform.position += transform.forward * _forwardVelocity * Time.fixedDeltaTime;
            }
            if(!newInput)
            {  
                Accelerate(_decelRatePerSecond);
                transform.position += transform.forward * _forwardVelocity * Time.fixedDeltaTime;
            }
        }
        newInput = false;
    }
    
    public void CalculateDirection()
    {
        _angle = Mathf.Atan2(walkVelocity.x, walkVelocity.y);
        _angle = Mathf.Rad2Deg * _angle;
        _angle += _cam.transform.eulerAngles.y;
    }
    public void SetRotation()
    {
        _targetRotation = Quaternion.Euler(0, _angle, 0);
        transform.rotation = Quaternion.Slerp(transform.rotation, _targetRotation, _turnSpeed * Time.deltaTime);
    }
    public void Accelerate(float accel)
    {
        // increases and decreases the forwardvelocity float.
        _forwardVelocity += accel * Time.fixedDeltaTime;
        _forwardVelocity = Mathf.Clamp(_forwardVelocity, 0, _maxSpeed);
    }

    void CheckGroundStatus()
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

