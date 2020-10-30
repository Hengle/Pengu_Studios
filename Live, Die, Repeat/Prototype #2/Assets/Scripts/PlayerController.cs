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
    //groundChecks
    Vector3 groundNormal;
    [HideInInspector]public bool isGrounded;
    float m_GroundCheckDistance = 1.1f;
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
        if (data.axes[0] != 0 || data.axes[1] != 0)
        {
            Accelerate(accelRatePerSecond);
        }

        newInput = true;
    }
    public void Look(Vector3 point, GameObject followTarget)
    {
        Vector3 direction = (point - transform.position);
        Quaternion rotation = Quaternion.LookRotation(direction);
        followTarget.transform.rotation = Quaternion.Slerp(followTarget.transform.rotation, rotation, lookSmoothtime * Time.fixedDeltaTime);
    }
    public void ResetRotation(GameObject followTarget, Quaternion followTargetInitialRotation)
    {
        followTarget.transform.rotation = Quaternion.Lerp(followTarget.transform.rotation, followTargetInitialRotation, (smoothTime) * Time.deltaTime);
    }
    private void Update()
    {
        if (Input.GetMouseButton(1) && !isScopedIn)
        {
            isScopedIn = true;
        }
        else if (Input.GetMouseButtonUp(1))
        {
            isScopedIn = false;
        }
    }

    public void CreateRay ()
    {
        Ray ray = cam.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, maxInteractDistance, interactable, QueryTriggerInteraction.Collide)) 
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
    public void Move ()
    {
        CheckGroundStatus();
        if(isGrounded)
        {
            if (newInput)
            {
                rb.velocity = transform.forward * forwardVelocity;
            }
            else
            {
                Accelerate(decelRatePerSecond);
            }
        }
        newInput = false;
    }

    public void Accelerate(float accel)
    {
        forwardVelocity += accel * Time.deltaTime;
        forwardVelocity = Mathf.Clamp(forwardVelocity, 0, maxSpeed);
    }

    void CheckGroundStatus()
    {
        RaycastHit hitInfo;
#if UNITY_EDITOR
        // helper to visualise the ground check ray in the scene view
        Debug.DrawLine(transform.position + (Vector3.up * 0.1f), transform.position + (Vector3.up * 0.1f) + (Vector3.down * m_GroundCheckDistance), Color.red);
#endif
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

