using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.WSA;

[RequireComponent(typeof(GunController))]
public class Player : LivingEntity
{
    public float moveSpeed = 5;
    float damping  = .1f;
    Camera viewCamera;
    PlayerController controller;
    GunController gunController;
    GameObject groundCursor;
    CameraController camCont;
    public Transform followTarget;
    [HideInInspector] public Rigidbody rb;
    protected override void Start()
    {
        base.Start();
        rb = GetComponent<Rigidbody>();
        camCont = FindObjectOfType<CameraController>();
        groundCursor = GameObject.Find("GroundCursor");
        controller = GetComponent<PlayerController>();
        viewCamera = Camera.main;
        gunController = GetComponent<GunController>();
    }

    void FixedUpdate()
    {
        //Movement input
        if (gunController.shotTime <= 1)
        {
            controller.Move();
        }
    }

    void Update()
    {
        // enemy detection
        //controller.FollowTarget(followTarget, )
        //Look input
        Ray ray = viewCamera.ScreenPointToRay(Input.mousePosition);
        Plane groundPlane = new Plane(Vector3.up, transform.position);
        float rayDistance;
        if (Input.GetMouseButtonDown(0))
        {
            controller.CreateRay();
        }

        if (controller.isScopedIn)
        {
            //Switch this....
            camCont.Fight();
        }
        else
        {
            camCont.ResetCam();
        }

        if (controller.isLockedOn)
        {
            if (controller.target != null)
            {
               //reticle changes
            }
            else 
            {
                controller.isLockedOn = false;
            }
        }

        if (groundPlane.Raycast(ray, out rayDistance))
        {
            // checks if the ray hit the ground and then sends the info to the point vector
            Vector3 point = ray.GetPoint(rayDistance);
            Debug.DrawLine(ray.origin, point, Color.red);
            groundCursor.transform.position = new Vector3(point.x, point.y - 1f, point.z);
            if (controller.isScopedIn)
            {
                gunController.Aim(point);
            }
            if (!controller.isScopedIn && !controller.isLockedOn)
            {
                gunController.Aim(groundCursor.transform.position);
            }

        }
        //Weapon input
        if (Input.GetMouseButton(0))
        {
            gunController.Shoot();
        }
    }
}