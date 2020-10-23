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
                if (!isLockedOn) 
                {
                    print("Hit");
                    isLockedOn = true;
                    target = hit.collider.gameObject;
                }

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
    /*public void GridMove (Vector3 moveInput, Transform movePoint)
    {
        if (moveInput == Vector3.zero)
        {
            Accelerate(decelRatePerSecond, 3);
        }
        if(Vector3.Distance(transform.position, movePoint.position) <= 1f)
        {
            if (Mathf.Abs(moveInput.x) == 1f)
            {
                movePoint.position += new Vector3((moveInput.x)/4, 0f, 0f);              
            }

            if (Mathf.Abs(moveInput.z) == 1f)
            {
                movePoint.position += new Vector3(0f, 0f, moveInput.z)/4;               
            }
            
        }
        if (moveInput.x > 0 || moveInput.z > 0)
        {
            transform.position = Vector3.MoveTowards(transform.position, movePoint.position, forwardVelocity * Time.deltaTime);
        }
        newInput = false;
    }*/

    public void Accelerate(float accel, float maxSpeed)
    {
        forwardVelocity += accel * Time.deltaTime;
        forwardVelocity = Mathf.Clamp(forwardVelocity, 0, maxSpeed);
    }

}

