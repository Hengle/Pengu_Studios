using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interactable : MonoBehaviour, IDamagable
{
    public Material StartingMaterial;
    public Color StartingColor;
    public float startingHealth;
    protected float health;
    protected bool yeeted;

    public event System.Action OnYeet;

    protected virtual void Start()
    {
        health = startingHealth;
    }

    public void TakeHit(float damage, RaycastHit hit)
    {
        //Work with the hit variable;
        TakeDamage(damage);
    }

    public void TakeDamage(float damage)
    {
        health -= damage;
        if (health <= 0 && !yeeted)
        {
            Yeet();
        }
    }
    protected void Yeet()
    {
        yeeted = true;
        if (OnYeet != null)
        {
            OnYeet();
        }
        GameObject.Destroy(gameObject);
    }
}

