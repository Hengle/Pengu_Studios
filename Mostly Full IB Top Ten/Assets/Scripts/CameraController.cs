using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    AwarenessScript eyes;
    public LayerMask interactable;
    int maxTargets = 3;
    float range = 20f;
    public Transform lookTarget;
    public Transform followTarget;
    Vector3 movement;
    public float moveSpeed;
    public Rigidbody rb;
    public GameObject hiddenObjects;
    public GameObject initialText;

    // Start is called before the first frame update
    void Start()
    {
        eyes = GetComponent<AwarenessScript>();
    }

    // Update is called once per frame
    void Update()
    {
        if (lookTarget.position.z < transform.position.z)
        {
            initialText.SetActive(false);
            hiddenObjects.SetActive(true);
        }
        if (Input.GetKey(KeyCode.Mouse1))
        {
            moveSpeed = 5;
        }
        else
        {
            moveSpeed = 2;
        }
        movement = new Vector3(0, 0, 1);
        
        if(Input.GetKey(KeyCode.Mouse0))
        {
            rb.MovePosition(followTarget.position + movement * moveSpeed * Time.fixedDeltaTime);
        }
        eyes.DetectInteractables(range, interactable, maxTargets, lookTarget);
    }
}
