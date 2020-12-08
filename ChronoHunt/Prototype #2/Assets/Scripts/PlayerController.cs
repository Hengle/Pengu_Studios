using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class PlayerController : MonoBehaviour
{
    //fine tune control variables
    float _maxSpeed = 6;
    float _timeZeroToMax = .5f;
    float _timeMaxToZero = .3f;
    float _timeSlideToZero = 1f;
    float _accelRatePerSecond;
    float _decelRatePerSecond;
    float _slideDecelRatePerSecond;
    float _maxInteractDistance = 30;
    //slide
    [SerializeField]float _slidePercent;
    float _slideTime = 1f;
    //Camera Stuff
    [HideInInspector]public Vector3 walkVelocity;
    [SerializeField]float _turnSpeed = 1;
    float _angle;
    Quaternion _targetRotation;
    //groundChecks
    Vector3 _groundNormal;
    [HideInInspector]public bool isGrounded;
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
    [HideInInspector] public bool isScopedIn = false;
    [HideInInspector] public bool isLockedOn = false;
    [HideInInspector]public bool canMove = true;
    //layermasks
    [SerializeField] LayerMask _enemy;
    //player state
    float _forwardVelocity;
    [HideInInspector] public bool running;
    [HideInInspector] public bool stopping;
    [HideInInspector] public bool moving;
    bool _sliding;
    Quaternion intialRotation;
    void Start()
    {
        intialRotation = transform.rotation;
        _groundNormal = Vector3.zero;
        isGrounded = true;
        _accelRatePerSecond = _maxSpeed / _timeZeroToMax;
        _decelRatePerSecond = -_maxSpeed / _timeMaxToZero;
        _slideDecelRatePerSecond = -_maxSpeed / _timeSlideToZero;
        _cam = Camera.main;
    }
     void ReadInput()
    {
        Vector2 movement = new Vector3(Input.GetAxisRaw("Vertical"), Input.GetAxisRaw("Horizontal"), 0).normalized;
        // Takes input from the input manager
        if (canMove)
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

        if(Input.GetKey(KeyCode.LeftShift))
        {
            _sliding = true;
            canMove = false;
        }
        else if(Input.GetKeyUp(KeyCode.LeftShift))
        {
            _sliding = false;
            canMove = true;
            _slidePercent = 0;
        }

        walkVelocity = walkVelocity.normalized;
     }

    private void Update()
    {
        ReadInput();
        // sliding
        if (_sliding)
        {
            StartCoroutine("Slide");
        }
        //Running
        if (_forwardVelocity == 0)
        {
            moving = false;
            stopping = false;
            running = false;
        }
        else 
        {
            moving = true;
        }
        if (_forwardVelocity >= 3)
        {
            running = true;
            stopping = false;
        }
        else if(_forwardVelocity <= 3 && running)
        {
            running = false;
            stopping = true;
        }
    }

    public void Move ()
    {
        if(isGrounded)
        {
            if (_groundAngle >= _maxGroundAngle) return;
            if (Input.anyKey)
            {
                transform.position += transform.forward * _forwardVelocity * Time.fixedDeltaTime;
            }
            else
            {  
                Accelerate(_decelRatePerSecond);
                transform.position += transform.forward * _forwardVelocity * Time.fixedDeltaTime;
            }
        }
    }

    void  Slide()
    {
        Vector3 initialRot = transform.eulerAngles;
        float _maxRotateAngle = 60;
        float interpolation = (Mathf.Pow(2, -_slidePercent));
        float slideAngle = Mathf.Lerp(0, _maxRotateAngle, interpolation);
        _slidePercent += Time.deltaTime * _slideTime;
        
        transform.rotation = Quaternion.Euler(slideAngle,0,0);
        
        Accelerate(_slideDecelRatePerSecond);
        transform.position += transform.forward * _forwardVelocity * Time.fixedDeltaTime * 1.3f;
    }
    IEnumerator ResetRotation()
    {
        yield return new WaitForSeconds(.3f);
        float _percent = 0;
        while(_percent < 1)
        {
            _percent += Time.deltaTime / 2;
            transform.rotation = Quaternion.Lerp(transform.rotation, intialRotation, _percent);
        }
        
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

