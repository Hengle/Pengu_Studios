using System.Collections;
using System.Collections.Generic;
using JetBrains.Annotations;
using UnityEditor.Experimental.GraphView;
using UnityEngine;


public class PlayerController : Controller
{
    public float smoothTime = 0.3F;
    public float maxSpeed;
    public float timeZeroToMax;
    public float timeMaxToZero;
    float accelRatePerSecond;
    float decelRatePerSecond;
    public float forwardVelocity;
    public LayerMask interactable;
    public LayerMask colliderObjects;
    public float maxInteractDistance;
    public GameObject target;
    public bool isScopedIn = false;
    public bool isLockedOn = false;
    Camera cam;
    Rigidbody rb;

    void Start()
    {
        accelRatePerSecond = maxSpeed / timeZeroToMax;
        decelRatePerSecond = -maxSpeed / timeMaxToZero;
        cam = Camera.main;
        rb = GetComponent<Rigidbody>();
    }
    public override void ReadInput(InputData data)
    {
        if (data.axes[0] != 0 || data.axes[1] != 0)
        {
            Accelerate(accelRatePerSecond, maxSpeed);
        }
        else
        {
            Accelerate(decelRatePerSecond, maxSpeed);
        }

        newInput = true;
    }
    public void Look(Vector3 point, Transform followTarget)
    {
        Vector3 direction = point - transform.position;
        Quaternion rotation = Quaternion.LookRotation(direction);
        followTarget.rotation = Quaternion.Slerp(followTarget.rotation, rotation, smoothTime * Time.fixedDeltaTime).normalized;
    }
    public void ResetRotation(Transform followTarget, Quaternion followTargetInitialRotation)
    {
        followTarget.rotation = Quaternion.Lerp(followTarget.rotation, followTargetInitialRotation, (smoothTime) * 20 * Time.deltaTime).normalized;
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
    public void Move (Vector3 moveInput)
    {
        if (moveInput == Vector3.zero)
        {
            Accelerate(decelRatePerSecond, 3);
        }
        rb.MovePosition(transform.position + moveInput * forwardVelocity * Time.fixedDeltaTime);
    }

    public void Accelerate(float accel, float maxSpeed)
    {
        forwardVelocity += accel * Time.deltaTime;
        forwardVelocity = Mathf.Clamp(forwardVelocity, 0, maxSpeed);
    }

}

