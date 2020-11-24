using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InteractableObject : Interactable
{

    protected override void Start()
    {
        StartingMaterial = GetComponent<Renderer>().material;
        StartingColor = StartingMaterial.color;
    }


}
