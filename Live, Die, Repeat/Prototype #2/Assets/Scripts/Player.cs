using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.WSA;

[RequireComponent(typeof(GunController))]
public class Player : LivingEntity
{
    public float moveSpeed = 5;

    Camera viewCamera;
    PlayerController controller;
    GunController gunController;
    GameObject groundCursor;
    CameraController camCont;
    GameObject followTarget;
    Quaternion followTargetInitialRot;
    [HideInInspector] public Rigidbody rb;
    protected override void Start()
    {
        base.Start();
        rb = GetComponent<Rigidbody>();
        camCont = FindObjectOfType<CameraController>();
        followTarget = GameObject.Find("FollowTarget");
        groundCursor = GameObject.Find("GroundCursor");
        controller = GetComponent<PlayerController>();
        viewCamera = Camera.main;
        gunController = GetComponent<GunController>();
        followTargetInitialRot = followTarget.transform.rotation;
    }

    void LateUpdate()
    {
        //Movement input
        Vector3 moveInput = new Vector3(Input.GetAxisRaw("Horizontal"), 0, Input.GetAxisRaw("Vertical"));
        controller.Move();
        //Weapon input
        if (Input.GetMouseButton(0))
        {
            gunController.Shoot();
        }
    }

    void Update()
    {
        //Look input
        Ray ray = viewCamera.ScreenPointToRay(Input.mousePosition);
        Plane groundPlane = new Plane(Vector3.up, transform.position);
        float rayDistance;
        if (Input.GetMouseButtonDown(0))
        {
            controller.CreateRay();
        }

        if (controller.isScopedIn == true)
        {
            camCont.AimIn();
        }
        else
        {
            camCont.AimOut();
            controller.ResetRotation(followTarget, followTargetInitialRot);
        }

        if (controller.isLockedOn)
        {
            if (controller.target != null)
            {
                gunController.Aim(controller.target.transform.position);
            }
            else 
            {
                controller.isLockedOn = false;
            }
        }

        if (groundPlane.Raycast(ray, out rayDistance))
        {
            Vector3 point = ray.GetPoint(rayDistance);
            Debug.DrawLine(ray.origin, point, Color.red);
            groundCursor.transform.position = new Vector3(point.x, point.y - 1f, point.z);
            if (controller.isScopedIn)
            {
                controller.Look(point, followTarget);
                gunController.Aim(point);
            }
            if (!controller.isScopedIn && !controller.isLockedOn)
            {
                gunController.Aim(groundCursor.transform.position);
            }

        }
    }
}