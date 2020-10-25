using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[RequireComponent(typeof(CharacterController))]

public class player : MonoBehaviour
{
    public float speed;
    public float slowMutliplier;

    private CharacterController controller;

    void Start()
    {
        controller = GetComponent<CharacterController>();
    }

    void Update()
    {
        Vector3 movementInput = new Vector3(Input.GetAxisRaw("Horizontal"), Input.GetAxisRaw("Vertical"), 0).normalized;

        Vector3 motion = movementInput;
        motion *= speed;
        motion *= (Input.GetButton("slow")) ? slowMutliplier : 1;

        controller.Move(motion * Time.deltaTime);
    }
}
