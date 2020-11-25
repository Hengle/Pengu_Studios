using UnityEngine;
using System.Collections;

public class Crosshairs : MonoBehaviour
{

	[SerializeField] LayerMask targetMask;
	[SerializeField] SpriteRenderer dot;
	[SerializeField] Color dotHighlightColour;
	Color originalDotColour;

	void Start()
	{
		//Cursor.visible = false;
		originalDotColour = dot.color;
	}

	void LateUpdate()
	{
		transform.Rotate(Vector3.forward * -40 * Time.deltaTime);
	}

	public void DetectTargets(Ray ray)
	{
		if (Physics.Raycast(ray, 1000, targetMask, QueryTriggerInteraction.Collide))
		{
			dot.color = dotHighlightColour;
		}
		else
		{
			dot.color = originalDotColour;
		}
	}
}