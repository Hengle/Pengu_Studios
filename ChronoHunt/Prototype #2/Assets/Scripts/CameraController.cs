using System.Collections;
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
    [SerializeField] float _smoothSpeed = .5f;
    [SerializeField] float _turnSpeed = 10;
    [SerializeField] float _moveSpeed = 5;

    Quaternion _targetRotation;
    Vector3 _targetPos;
    bool _smoothRotating = false;
    private void Awake()
    {
        _cam = Camera.main;
    }

    private void Update()
    {
        MoveWithTarget();
        LookAtTarget();
        if(Input.GetKey(KeyCode.F) && !_smoothRotating)
        {
            StartCoroutine(RotateAroundTarget(90));
        }
        if (Input.GetKey(KeyCode.G) && !_smoothRotating)
        {
            StartCoroutine(RotateAroundTarget(-90));
        }
    }

    void MoveWithTarget()
    {
        _targetPos = _target.transform.position + _offsetPos;
        transform.position = Vector3.Lerp(transform.position, _targetPos, _moveSpeed * Time.fixedDeltaTime);
    }
    void LookAtTarget()
    {
        _targetRotation = Quaternion.LookRotation(_target.position - _cam.transform.position);
        transform.rotation = Quaternion.Slerp(transform.rotation, _targetRotation, _turnSpeed * Time.fixedDeltaTime);
    }
    IEnumerator RotateAroundTarget(float angle)
    {
        Vector3 _vel = Vector3.zero;
        Vector3 _targetOffsetPos = Quaternion.Euler(0, angle, 0) * _offsetPos;
        float dist = Vector3.Distance(_offsetPos, _targetOffsetPos);
        _smoothRotating = true;

        while (dist > 0.02f)
        {
            _offsetPos = Vector3.SmoothDamp(_offsetPos, _targetOffsetPos, ref _vel, _smoothSpeed);
            dist = Vector3.Distance(_offsetPos, _targetOffsetPos);
            yield return null;
        }
        _smoothRotating = false;
        _offsetPos = _targetOffsetPos;
    }
    
}
