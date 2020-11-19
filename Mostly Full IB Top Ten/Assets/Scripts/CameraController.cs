﻿using System.Collections;
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

    // Start is called before the first frame update
    void Start()
    {
        eyes = GetComponent<AwarenessScript>();
    }

    // Update is called once per frame
    void Update()
    {

        movement = new Vector3(0, 0, Input.GetAxisRaw("Vertical"));

        rb.MovePosition(followTarget.position + movement * moveSpeed * Time.fixedDeltaTime);
        eyes.DetectInteractables(range, interactable, maxTargets, lookTarget);
    }
}