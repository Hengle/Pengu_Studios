using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.WSA;

[RequireComponent(typeof(PlayerController))]
[RequireComponent(typeof(GunController))]
public class Player : LivingEntity
{
    public float moveSpeed = 5;

    Camera viewCamera;
    PlayerController controller;
    GunController gunController;
    public Transform firePoint;
    public float radius;
    public GameObject groundCursor;
    public Rigidbody rb;
    public GameObject mainCam;
    public GameObject aimCam;
    protected override void Start()
    {
        base.Start();
        controller = GetComponent<PlayerController>();
        viewCamera = Camera.main;
        gunController = GetComponent<GunController>();

    }

    private void FixedUpdate()
    {
        //Movement input
        Vector3 moveInput = new Vector3(Input.GetAxisRaw("Horizontal"), 0, Input.GetAxisRaw("Vertical"));
        Vector3 moveVelocity = moveInput.normalized;
        if (transform.position.y < 1.3f && !Input.GetMouseButtonDown(0))
        {
            controller.Move(moveVelocity);
        }
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
            mainCam.SetActive(false);
            aimCam.SetActive(true);
        }
        else
        {
            aimCam.SetActive(false);
            mainCam.SetActive(true);
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
            groundCursor.transform.position = new Vector3(point.x, point.y - 1f, point.z);
            if (!controller.isLockedOn)
            {
                if((new Vector3 (point.x,point.y, point.z) - new Vector3 (transform.position.x, transform.position.y, transform.position.z)).sqrMagnitude > 1.2f)
                {
                    gunController.Aim(groundCursor.transform.position);
                }                      
            }
        }

    }


    
}