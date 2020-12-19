﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    /// <summary>
    // Objects
    [SerializeField] Transform _target;
    Camera _cam;
    /// </summary>

    [SerializeField] Vector3 _offsetPos = Vector3.zero;
    [SerializeField] float _smoothSpeed = 5f;
    [SerializeField] float _turnSpeed = 10;
    [SerializeField] float _moveSpeed = 5;

    Quaternion _nextRotation;
    Vector3 _targetPos;
    private void Awake()
    {
        _cam = Camera.main;
    }

    private void Update()
    {
        MoveWithTarget();
        if (Input.GetKey(KeyCode.Q))
        {
            RotateCamera(-1f);
        }
        if(Input.GetKey(KeyCode.E))
        {
            RotateCamera(1f);
        }
        //LookAtTarget();
    }

    void MoveWithTarget()
    {
        _targetPos = _target.transform.position + _offsetPos;
        transform.position = _targetPos;
    }
    void LookAtTarget()
    {
        //_targetRotation = Quaternion.LookRotation(_target.position - _cam.transform.position);
        //transform.rotation = Quaternion.Slerp(transform.rotation, _targetRotation, _turnSpeed * Time.fixedDeltaTime);
    }
    void RotateCamera(float angle)
    {
        transform.rotation *= Quaternion.AngleAxis(angle * _turnSpeed, Vector2.up);
        Vector3 rot = new Vector3(30, transform.localEulerAngles.y, 0);
        transform.localEulerAngles = rot;
    }
}
