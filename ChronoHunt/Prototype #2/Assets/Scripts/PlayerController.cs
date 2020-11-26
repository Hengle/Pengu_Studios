using System.Collections;
using System.Collections.Generic;

using UnityEngine;


public class PlayerController : Controller
{
    //fine tune control variables
    float maxSpeed = 6;
    float timeZeroToMax = .5f;
    float timeMaxToZero = .5f;
    float accelRatePerSecond;
    float decelRatePerSecond;
    float maxInteractDistance = 30;
    [HideInInspector]public Vector3 walkVelocity;
    //groundChecks
    Vector3 groundNormal;
    [HideInInspector]public bool isGrounded;
    float m_GroundCheckDistance = 1f;
    //gameobjects/components
    Camera cam;
    Rigidbody rb;
    [HideInInspector]public GameObject target;
    //bools
    [HideInInspector]public bool isScopedIn = false;
    [HideInInspector]public bool isLockedOn = false;
    //layermasks
    [SerializeField] LayerMask enemy;
    //player state
    [SerializeField]float forwardVelocity;
    [HideInInspector] public bool moving;
    [HideInInspector] public bool running;
    Vector3 forward, right; // Keeps track of our relative forward and right vectors
    void Start()
    {
        forward = Camera.main.transform.forward; // Set forward to equal the camera's forward vector
        forward.y = 0; // make sure y is 0
        forward = Vector3.Normalize(forward); // make sure the length of vector is set to a max of 1.0
        right = Quaternion.Euler(new Vector3(0, 90, 0)) * forward; // set the right-facing vector to be facing right relative to the camera's forward vector
        groundNormal = Vector3.zero;
        isGrounded = true;
        accelRatePerSecond = maxSpeed / timeZeroToMax;
        decelRatePerSecond = -maxSpeed / timeMaxToZero;
        cam = Camera.main;
        rb = GetComponent<Rigidbody>();
    }
    public override void ReadInput(InputData data)
    {
        // Takes input from the input manager
        if (data.axes[0] != 0)
        {
            Accelerate(accelRatePerSecond);
            walkVelocity += Vector3.up * data.axes[0];
        }
        if (data.axes[1] != 0)
        {
            Accelerate(accelRatePerSecond);
            walkVelocity += Vector3.right * data.axes[1];
        }
        walkVelocity = walkVelocity.normalized;
        newInput = true;
    }

    private void Update()
    {
        if (Input.GetMouseButtonDown(1) && !isScopedIn)
        {
            isScopedIn = true;
        }
        else if (Input.GetMouseButtonDown(1))
        {
            isScopedIn = false;
        }
    }
    public void FollowTarget(Transform followTarget, float damping, Transform enemy)
    {
        followTarget.transform.rotation = Quaternion.Lerp(followTarget.transform.rotation, enemy.transform.rotation, damping);
    }

    public void CreateRay ()
    {
        //Creates a ray to dectect if the player hit an enemy
        Ray ray = cam.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, maxInteractDistance, enemy, QueryTriggerInteraction.Collide)) 
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
            Vector3 rightMovement = right * forwardVelocity * Time.deltaTime * walkVelocity.x; // Our right movement is based on the right vector, movement speed, and our GetAxis command. We multiply by Time.deltaTime to make the movement smooth.
            Vector3 upMovement = forward * forwardVelocity * Time.deltaTime * walkVelocity.y; // Up movement uses the forward vector, movement speed, and the vertical axis inputs.
            if (newInput)
            {
                transform.position += rightMovement; // move our transform's position right/left
                transform.position += upMovement; // Move our transform's position up/down
                if (forwardVelocity > 0)
                {
                    moving = true;
                    if (forwardVelocity > 3)
                    {
                        running = true;
                    }
                }
            }
            if(!newInput)
            {  
                if (forwardVelocity <= 5)
                {
                    running = false;
                    moving = false;
                }
                Accelerate(decelRatePerSecond);
                transform.position += rightMovement; // move our transform's position right/left
                transform.position += upMovement; // Move our transform's position up/down
            }
        }
        newInput = false;
    }

    public void Accelerate(float accel)
    {
        // increases and decreases the forwardvelocity float.
        forwardVelocity += accel * Time.deltaTime;
        forwardVelocity = Mathf.Clamp(forwardVelocity, 0, maxSpeed);
    }

    void CheckGroundStatus()
    {
        //checks to see if the player is touching the ground
        RaycastHit hitInfo;
        // helper to visualise the ground check ray in the scene view
        Debug.DrawLine(transform.position + (Vector3.up * 0.1f), transform.position + (Vector3.up * 0.1f) + (Vector3.down * m_GroundCheckDistance), Color.red);
        // 0.1f is a small offset to start the ray from inside the character
        // it is also good to note that the transform position in the sample assets is at the base of the character
        if (Physics.Raycast(transform.position + (Vector3.up * 0.1f), Vector3.down, out hitInfo, m_GroundCheckDistance))
        {
            groundNormal = hitInfo.normal;
            isGrounded = true;
        }
        else
        {
            isGrounded = false;
            groundNormal = Vector3.up;
        }
    }
}

