using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class PlayerController : MonoBehaviour
{
    //fine tune control variables
    public float maxSpeed = 4;
    float _timeZeroToMax = .5f;
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
    float _centerChangeVertical = -.35f;
    CapsuleCollider col;

    //Dodge
    float _dodgeSpeed = 4;
    float _dodgeTime = .7f;
    float _dodgeHeight = .2f;
    [HideInInspector] public bool isDodging = false;
    [HideInInspector] public bool hasDodged;

    //Camera Stuff
    [HideInInspector] public Vector3 walkVelocity;
    float _angle;
    Quaternion _targetRotation;

    //groundChecks
    float _height = 1f;
    float _heightPadding = .1f;
    [SerializeField]LayerMask _ground = 10;
    RaycastHit _hitInfo;

    //gameobjects/components
    Camera _cam;
    [HideInInspector] public GameObject target;
    Rigidbody rb;

    //layermasks
    LayerMask _enemy = 8;

    //player state
    public float forwardVelocity;
    [HideInInspector] public bool isWalking;
    [HideInInspector] public bool isRunning;
    [HideInInspector] public bool isStopping;
    [HideInInspector] public bool isMoving;
    [HideInInspector] public bool isSliding;
    [HideInInspector] public bool isTurning;
    [HideInInspector] public bool isScopedIn = false;
    [HideInInspector] public bool isLockedOn = false;
    [HideInInspector] public bool canMove = true;
    [HideInInspector] public bool canInput = true;
    [SerializeField]bool _canDecelMove;

    public bool isGrounded;
    Vector2 movement;
    float _dotProductForward;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
        col = GetComponent<CapsuleCollider>();
        _intitalHeight = col.height;
        _accelRatePerSecond = maxSpeed / _timeZeroToMax;
        _decelRatePerSecond = -maxSpeed / _timeMaxToZero;
        _slideDecelRatePerSecond = -maxSpeed / _timeSlideToZero;
        _cam = Camera.main;
    }
    public void ReadInput()
    {
        //movement
        movement = new Vector3(Input.GetAxisRaw("Vertical"), Input.GetAxisRaw("Horizontal"), 0).normalized;
        // Takes input from the input manager
        if (canInput)
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
        if (Input.GetKeyDown(KeyCode.LeftAlt) && !isSliding && isGrounded && !isWalking)
        {
            isSliding = true;
            canInput = false;
        }

        //dodge
        if (Input.GetKeyDown(KeyCode.Space) && isMoving && !isWalking)
        {
            isDodging = true;
        }
        else if (Input.GetKeyUp(KeyCode.Space))
        {
            hasDodged = false;
        }
        walkVelocity = walkVelocity.normalized;
    }

    private void Update()
    {
        _slideSpeed = forwardVelocity * .3f;
        _dodgeSpeed = forwardVelocity * 1.5f;

    }
    public void Move()
    {
        if((Input.GetKey(KeyCode.W) || Input.GetKey(KeyCode.A) || Input.GetKey(KeyCode.S) || Input.GetKey(KeyCode.D)) && !isRunning)
        {
            forwardVelocity = 2;
            transform.position += transform.forward * forwardVelocity * Time.fixedDeltaTime;
            isWalking = true;
        }
        else
        {
            isWalking = false;
        }

        if (Input.GetKey(KeyCode.LeftShift) &&(Input.GetKey(KeyCode.W) || Input.GetKey(KeyCode.A) || Input.GetKey(KeyCode.S) || Input.GetKey(KeyCode.D)))
        {
            isRunning = true;
            if (!isTurning)
            {
                transform.position += transform.forward * forwardVelocity * Time.fixedDeltaTime;
            }
        }
        else if(!isWalking)
        {  
            Accelerate(_decelRatePerSecond);
            transform.position += transform.forward * forwardVelocity * Time.fixedDeltaTime;
        }
        
    }

    public void Slide()
    {   
        if(_slidePercent <= 100)
        {
            _slidePercent += _timeSlideToZero * 10;
            Vector3 _newHeight = new Vector3(transform.localScale.x, transform.localScale.y - _heightChangeVertical, transform.localScale.z);
            col.height = _newHeight.y;
            col.center = new Vector3(col.center.x, _centerChangeVertical, col.center.z);
        }
        if (_slidePercent >= 100 && !_hasReturnedFromSlide)
        {
            StartCoroutine("ResetRotation");
        }
        Accelerate(_slideDecelRatePerSecond);
        transform.position += transform.forward * forwardVelocity * Time.fixedDeltaTime * _slideSpeed;      
    }
    IEnumerator ResetRotation()
    {
        _hasReturnedFromSlide = true;
        isSliding = false;
        float _returnPercent = 0;
        yield return new WaitForSeconds(_timeSlideToZero * .05f);
        _slidePercent = 0;
        canInput = true;
        _hasReturnedFromSlide = false;
        while (_returnPercent < 1)
        {
            _returnPercent += Time.fixedDeltaTime;
            col.height = _intitalHeight;
            col.center = new Vector3(col.center.x, .6083462f, col.center.z);
        }
    }

    public void Dodge()
    {
        if (isGrounded & !hasDodged && canMove)
        {
            StartCoroutine("StartDodge");
        }
    }
    IEnumerator StartDodge()
    {
        canInput = false;
        yield return new WaitForSeconds(.2f);
        col.direction = 2;
        rb.velocity = Vector3.Lerp(rb.velocity, new Vector3(rb.transform.forward.x, rb.transform.forward.y + _dodgeHeight, rb.transform.forward.z) * _dodgeSpeed, _dodgeTime);
        hasDodged = true;
        yield return new WaitForSeconds(.3f);
        col.direction = 1;
        isDodging = false;
        hasDodged = false;
        yield return new WaitForSeconds(.2f);
        canInput = true;

    }
    public void Accelerate(float accel)
    {
        // increases and decreases the forwardvelocity float.
        forwardVelocity += accel * Time.fixedDeltaTime;
        forwardVelocity = Mathf.Clamp(forwardVelocity, 0, maxSpeed);
    }

    public void CheckForTurns()
    {
        Vector3 camForward = _cam.transform.forward;
        Vector3 camRight = _cam.transform.right;
        Vector3 inputDir = camForward * walkVelocity.y + camRight * walkVelocity.x;

        _dotProductForward = Vector3.Dot(transform.forward.normalized, inputDir.normalized);
        //print(_dotProductForward);
        //dotProduct of 1 is forward movement
        if(_dotProductForward == 1)
        {
            isTurning = false;
            _canDecelMove = true;
        }
        else if (_dotProductForward == -.00000004214685f || _dotProductForward == 0 && forwardVelocity > 0)
        {
            isTurning = true;
            canInput = false;
            canMove = false;
            _canDecelMove = false;
            StartCoroutine("Turn");
        }
        else if (_dotProductForward < .98f && _dotProductForward > .8f)
        {
            _canDecelMove = false;
            forwardVelocity = 3.2f;
        }

    }
    IEnumerator Turn()
    {
        Accelerate(_decelRatePerSecond);
        isMoving = false;
        yield return new WaitForSeconds(_decelRatePerSecond);
        isStopping = false;
        forwardVelocity = 0f;
        Accelerate(_decelRatePerSecond);
        canInput = true;
        yield return new WaitForSeconds(_decelRatePerSecond);
        canMove = true;
        yield return new WaitForSeconds(.1f);
        isTurning = false;

    }
    public void SetRotation()
    {
        _targetRotation = Quaternion.Euler(0, _angle, 0);
        transform.rotation = _targetRotation;
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
                isLockedOn = true;
                target = hit.collider.gameObject;
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
        
        Debug.DrawLine(transform.position, transform.position - Vector3.up * (_height + _heightPadding), Color.red);
        // 0.1f is a small offset to start the ray from inside the character
        if (Physics.Raycast(transform.position, -Vector3.up, out _hitInfo, _height + _heightPadding, _ground))
        {
            if(Vector3.Distance(transform.position, _hitInfo.point) > _height)
            {
                transform.position = Vector3.Lerp(transform.position, transform.position + Vector3.up * _height, 1 * Time.deltaTime);
            }
            isGrounded = true;
        }
        else
        {
            isGrounded = false;
        }
        
    }

}

