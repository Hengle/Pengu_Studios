using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

[RequireComponent(typeof(NavMeshAgent))]
public class Enemy : LivingEntity
{
    public enum State { _Idle, _Chasing, _Attacking };
    State _currentState;
    [SerializeField] GameObject _deathEffect;
    Material _skinMaterial;
    Color _originalColor;
    public NavMeshAgent pathfinder;
    LivingEntity _targetEntity;
    Transform _target;
    float _attackDistanceThreshold = 1.5f;
    float _timeBetweenAttacks = 1f;
    float _nextAttackTime;
    float _myCollisionRadius;
    float _targetCollisionRadius;
    bool _hasTarget;
    [HideInInspector] public float damage = 1;
    protected override void Start()
    {
        base.Start();
        pathfinder = GetComponent<NavMeshAgent>();
        _skinMaterial = GetComponent<Renderer>().material;
        _originalColor = _skinMaterial.color;

        if (GameObject.FindGameObjectWithTag("Player") != null)
        {
            _currentState = State._Chasing;
            _hasTarget = true;
            _target = GameObject.FindGameObjectWithTag("Player").transform;
            _targetEntity = _target.GetComponent<LivingEntity>();
            _targetEntity.OnDeath += OnTargetDeath;

            _myCollisionRadius = GetComponent<CapsuleCollider>().radius;
            _targetCollisionRadius = _target.GetComponent<CapsuleCollider>().radius;
            StartCoroutine(UpdatePath());
        }
    }

    public override void TakeHit(float damage, Vector3 hitpoint, Vector3 hitdirection)
    {
        if (damage >= health)
        {
            Destroy(Instantiate(_deathEffect, hitpoint, Quaternion.FromToRotation(Vector3.forward, hitdirection)) as GameObject, 2f);
        }
        base.TakeHit(damage, hitpoint, hitdirection);
    }
    void OnTargetDeath()
    {
        _hasTarget = false;
        _currentState = State._Idle;
    }

    void Update()
    {
        if (_hasTarget)
        {
            if (Time.time > _nextAttackTime)
            {
                float sqrDstToTarget = (_target.position - transform.position).sqrMagnitude;
                if (sqrDstToTarget < Mathf.Pow(_attackDistanceThreshold + _myCollisionRadius + _targetCollisionRadius, 2))
                {
                    _nextAttackTime = Time.time + _timeBetweenAttacks;
                    StartCoroutine("Attack");
                }
            }
        }
    }
    IEnumerator Attack()
    {
        _currentState = State._Attacking;
        pathfinder.enabled = false;
        Vector3 originalPosition = transform.position;
        Vector3 dirToTarget = (_target.position - transform.position).normalized;
        Vector3 attackPosition = _target.position - dirToTarget * (_myCollisionRadius);

        float attackSpeed = 3;
        float percent = 0;

        _skinMaterial.color = Color.red;
        bool hasAppliedDamage = false;


        while(percent <= 1)
        {
            if (percent >= .5f && !hasAppliedDamage)
            {
                hasAppliedDamage = true;
                _targetEntity.TakeDamage(damage);
            }
            percent += Time.deltaTime * attackSpeed;
            float interpolation = (-Mathf.Pow(percent, 2) + percent) * 4;
            transform.position = Vector3.Lerp(originalPosition, attackPosition, interpolation);
            yield return null;
        }
        _skinMaterial.color = _originalColor;
        _currentState = State._Chasing;
        pathfinder.enabled = true;
    }
    IEnumerator UpdatePath()
    {
        float refreshRate = .25f;

        while(_hasTarget)
        {
            if (_currentState == State._Chasing)
            {
                Vector3 dirToTarget = (_target.position - transform.position).normalized;
                Vector3 targetPosition = _target.position - dirToTarget * (_myCollisionRadius + _targetCollisionRadius + _attackDistanceThreshold/2);
                if (!dead)
                {
                    pathfinder.SetDestination(targetPosition);
                }
            }
            yield return new WaitForSeconds(refreshRate);
        }
    }
}
