using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.WSA;

[RequireComponent(typeof(GunController))]
public class Player : LivingEntity
{
    public float moveSpeed = 5;
    float interactDistance = 5;
    float viewDistance = 40;
    public LayerMask interactables;
    public LayerMask enemies;
    int maxtargets = 5;
    public float recoveryTime;
    Camera viewCamera;
    PlayerController controller;
    GunController gunController;
    AwarenessScript eyes;
    CameraController camCont;
    public Transform followTarget;
    [HideInInspector] public Rigidbody rb;
    public Crosshairs crosshair;
    protected override void Start()
    {
        base.Start();
        rb = GetComponent<Rigidbody>();
        camCont = FindObjectOfType<CameraController>();
        eyes = GetComponent<AwarenessScript>();
        controller = GetComponent<PlayerController>();
        viewCamera = Camera.main;
        gunController = GetComponent<GunController>();
    }

    void FixedUpdate()
    {
        //Movement input
        if (gunController.shotTime <= recoveryTime)
        {
            controller.Move();
        }
    }

    void Update()
    {
        //Interactable detection
        eyes.DetectInteractables(interactDistance, interactables, maxtargets);
        eyes.DetectEnemies(viewDistance, enemies, maxtargets);
        Ray ray = viewCamera.ScreenPointToRay(Input.mousePosition);
        Plane groundPlane = new Plane(Vector3.up, Vector3.zero);
        float rayDistance;
        if (Input.GetMouseButtonDown(0))
        {
            controller.CreateRay();
        }

        if (eyes.enemiesInRange)
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
            /*if (controller.isScopedIn)
            {
                gunController.Aim(point);
            }
            if (!controller.isScopedIn && !controller.isLockedOn)
            {
                gunController.Aim(groundCursor.transform.position);
            }
            */

            gunController.Aim(point);
            crosshair.transform.position = point;
            crosshair.DetectTargets(ray);
        }
        //Weapon input
        if (Input.GetMouseButton(0))
        {
            gunController.Shoot();
        }
    }
}