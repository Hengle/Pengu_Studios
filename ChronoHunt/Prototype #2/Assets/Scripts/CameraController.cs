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
    private void Awake()
    {
        _cam = Camera.main;
    }

    private void Update()
    {
        MoveWithTarget();
        if (Input.GetKey(KeyCode.F))
        {
            RotateCamera(-2f);
        }
        if(Input.GetKey(KeyCode.G))
        {
            RotateCamera(2f);
        }
        //LookAtTarget();
    }

    void MoveWithTarget()
    {
        _targetPos = _target.transform.position + _offsetPos;
        transform.position = Vector3.Lerp(transform.position, _targetPos, _moveSpeed * Time.fixedDeltaTime);
    }
    void LookAtTarget()
    {
        //_targetRotation = Quaternion.LookRotation(_target.position - _cam.transform.position);
        //transform.rotation = Quaternion.Slerp(transform.rotation, _targetRotation, _turnSpeed * Time.fixedDeltaTime);
    }
    void RotateCamera(float angle)
    {
        _targetRotation = Quaternion.LookRotation(transform.position - new Vector3(transform.position.x, transform.position.y, transform.position.z + angle));
        transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.Euler(30, _targetRotation.z, 0), _turnSpeed * Time.fixedDeltaTime);

    }
}
