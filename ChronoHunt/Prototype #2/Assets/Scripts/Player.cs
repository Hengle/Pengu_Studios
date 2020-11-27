using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(GunController))]
public class Player : LivingEntity
{
    float interactDistance = 5;
    float outerInteractDistance = 20;
    float viewDistance = 40;
    float maxRayDistance = 20f;
    [SerializeField] LayerMask interactables;
    [SerializeField] LayerMask enemies;
    [SerializeField] LayerMask layerMask;
    int maxtargets = 5;
    [SerializeField] float recoveryTime;
    Camera viewCamera;
    PlayerController controller;
    GunController gunController;
    AwarenessScript eyes;
    CameraController camCont;
    [SerializeField] Transform followTarget;
    [HideInInspector] public Rigidbody rb;
    [SerializeField] Crosshairs crosshair;
    [SerializeField] Animator playerAnim;
    Vector3 point;
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
        controller.Move();
    }

    void Update()
    {
        //set animations
        playerAnim.SetBool("Moving", controller.moving);
        playerAnim.SetBool("Running", controller.running);
        playerAnim.SetFloat("WalkVel", controller.walkVelocity.x);
        //Interactable detection
        eyes.DetectInteractables(interactDistance,outerInteractDistance, interactables, maxtargets);
        eyes.DetectEnemies(viewDistance, enemies, maxtargets);
        Vector2 mouseScreenPosition = Input.mousePosition;
        mouseScreenPosition = new Vector3(mouseScreenPosition.x,mouseScreenPosition.y, 0) - transform.position;
        Ray ray = viewCamera.ScreenPointToRay(mouseScreenPosition);
        RaycastHit hit;
        if (Input.GetMouseButtonDown(0))
        {
            controller.CreateRay();
        }

        if (eyes.enemiesInRange || Input.GetMouseButtonDown(1))
        {
            //Switch this....
            camCont.Fight();
        }
        else if(Input.GetMouseButtonDown(1))
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
        
        if (Physics.Raycast(ray.origin, ray.direction, out hit, maxRayDistance, layerMask))
        {
            point = hit.point;
            crosshair.DetectTargets(ray);
        }
        else
        {
            point = ray.origin + ray.direction * maxRayDistance;
        }
        Debug.DrawLine(ray.origin, point, Color.red);
        crosshair.transform.position = point;
        if ((new Vector3(point.x, point.z) - new Vector3(transform.position.x, transform.position.z)).sqrMagnitude > .5f)
        {
            gunController.Aim(point);
        }
        //Weapon input
        if (Input.GetKeyDown(KeyCode.R))
        {
            gunController.Reload();
        }
        if (Input.GetMouseButton(0))
        {
            gunController.OnTriggerHold();
        }
        if(Input.GetMouseButtonUp(0))
        {
            gunController.OnTriggerRelease();
        }
    }
}