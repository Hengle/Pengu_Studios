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
    // Start is called before the first frame update
    void Start()
    {
        eyes = GetComponent<AwarenessScript>();
    }

    // Update is called once per frame
    void Update()
    {
        
        eyes.DetectInteractables(range, interactable, maxTargets, lookTarget);
    }
}
