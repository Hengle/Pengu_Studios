using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class AwarenessScript : MonoBehaviour
{
    public bool enemiesInRange;
    public void DetectInteractables(float range,float outerRange, LayerMask interactables, int maxTargets)
    {
        Material interactColor;
        Material currentColor;
        //Get any colliders in this range that are on the layermask
        Collider[] interactablesInRange = Physics.OverlapSphere(transform.position, range, interactables);
        Collider[] interactablesInOuterRange = Physics.OverlapSphere(transform.position, outerRange, interactables);

        //For if more than maxTargets were found
        if (interactablesInRange.Length > maxTargets)
        {
            //sort by distance
            interactablesInRange.OrderBy(hit => Vector3.Distance(hit.transform.position, transform.position));
        }
        if (interactablesInOuterRange.Length > maxTargets)
        {
            //sort by distance
            interactablesInOuterRange.OrderBy(hit => Vector3.Distance(hit.transform.position, transform.position));
        }

        //This is a list for all of the interactables in the range
        List<InteractableObject> interactablesToHit = new List<InteractableObject>();
        List<InteractableObject> interactablesInOuterRangeToHit = new List<InteractableObject>();
        //populate the InteractablesInOuterRange list
        for (int i = 0; i < maxTargets; i++)
        {
            if (i < interactablesInOuterRange.Length)
            {
                interactablesInOuterRangeToHit.Add(interactablesInOuterRange[i].GetComponent<InteractableObject>());
                
            }
            else
            {
                break;
            }
        }
        //populate the tnteractablesToHit list
        for (int i = 0; i < maxTargets; i++)
        {
            if (i < interactablesInRange.Length)
            {
                interactablesToHit.Add(interactablesInRange[i].GetComponent<InteractableObject>());
            }
            else
            {
                break;
            }
        }

        foreach (InteractableObject inRange in interactablesInOuterRangeToHit)
        {
            currentColor = inRange.GetComponent<Renderer>().material;
            currentColor.color = inRange.StartingColor;
        }

        foreach (InteractableObject interactable in interactablesToHit)
        {
            interactColor = interactable.GetComponent<Renderer>().material;
            interactColor.color = Color.white;
        }

    }

    public void DetectEnemies(float range, LayerMask enemies, int maxTargets)
    {
        //Get any colliders in this range that are on the layermask
        Collider[] EnemiesInRange = Physics.OverlapSphere(transform.position, range, enemies, QueryTriggerInteraction.Collide);

        //For if more than maxTargets were found
        if (EnemiesInRange.Length > maxTargets)
        {
            //sort by distance
            EnemiesInRange.OrderBy(hit => Vector3.Distance(hit.transform.position, transform.position));
        }

        //This is a list for all of the interactables in the range
        List<GameObject> enemiesToHit = new List<GameObject>();

        //populate the tnteractablesToHit list
        for (int i = 0; i < maxTargets; i++)
        {
            if (i < EnemiesInRange.Length)
            {
                enemiesToHit.Add(EnemiesInRange[i].gameObject);
            }
            else
            {
                break;
            }
        }

        if (enemiesToHit.Count > 0)
        {
            enemiesInRange = true;
        }
        else if (enemiesToHit.Count == 0)
        {
            StartCoroutine(EndFight(5));
        }
        foreach(GameObject enemy in enemiesToHit)
        {
            print(enemiesToHit.Count + " Enemies");
        }
    }
    IEnumerator EndFight(float wait)
    {
        yield return new WaitForSeconds(wait);
        enemiesInRange = false;
    }
}
