using System.Collections;
using System.Collections.Generic;
using JetBrains.Annotations;
using UnityEditor.Experimental.GraphView;
using UnityEngine;


public class PlayerController : Controller
{
    //fine tune control variables
    float smoothTime = 1F;
    float lookSmoothtime = .3f;
    float maxSpeed = 6;
    float timeZeroToMax = .5f;
    float timeMaxToZero = 1;
    float accelRatePerSecond;
    float decelRatePerSecond;
    float maxInteractDistance = 30;
    Vector3 walkVelocity;
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
    public LayerMask interactable;
    public LayerMask colliderObjects;
    //player state
    float forwardVelocity;
    void Start()
    {
        groundNormal = Vector3.zero;
        isGrounded = true;
        accelRatePerSecond = maxSpeed / timeZeroToMax;
        decelRatePerSecond = -maxSpeed / timeMaxToZero;
        cam = Camera.main;
        rb = GetComponent<Rigidbody>();
    }
    public override void ReadInput(InputData data)
    {
        // Takes input from the input manage
        if (data.axes[0] != 0)
        {
            Accelerate(accelRatePerSecond);
            walkVelocity += Vector3.forward * data.axes[0];
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

    public void CreateRay ()
    {
        //Creates a ray to dectect if the player hit an enemy
        Ray ray = cam.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, maxInteractDistance, interactable, QueryTriggerInteraction.Collide)) 
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
            if (newInput)
            {
                walkVelocity = Camera.main.transform.TransformDirection(walkVelocity);
                walkVelocity.y = 0f;
                rb.velocity = walkVelocity * forwardVelocity;
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

