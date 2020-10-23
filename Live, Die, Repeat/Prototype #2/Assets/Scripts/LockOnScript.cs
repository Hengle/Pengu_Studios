using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LockOnScript : MonoBehaviour
{
    public Camera cam;
    public float interactDist;

    private GameObject target;
    private bool isLockedOn = false;

    private MouseLook mouseLook;

    private void Start()
    {
        mouseLook = GetComponent<MouseLook>();
    }
    private void Update()
    {
        if (Input.GetMouseButtonDown(0))//-----how you lock on
        {
            DoRay();
        }

        if (Input.GetMouseButtonDown(1))//-----how you unlock
        {
            isLockedOn = false;
            mouseLook.Adjust_Target_Info(isLockedOn, target.transform);
        }

        if (isLockedOn)
        {
            //update stuff here
            mouseLook.Adjust_Target_Info(isLockedOn, target.transform);
        }

    }

    private void DoRay()
    {
        Ray ray = cam.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;

        if (Physics.Raycast(ray, out hit, interactDist))
        {
            if (hit.collider.CompareTag("Enemy"))
            {
                if (!isLockedOn)
                {
                    Debug.DrawLine(ray.origin, hit.point, Color.red);
                    isLockedOn = true;
                    target = hit.collider.gameObject;
                }

                //deal damage to enemy

            }
        }
    }
}
