using UnityEngine;
using System.Collections;

public class Crosshairs : MonoBehaviour
{

	[SerializeField] LayerMask _targetMask;
	[SerializeField] SpriteRenderer _dot;
	[SerializeField] Color _dotHighlightColour;
	Color _originalDotColour;

	void Start()
	{
		//Cursor.visible = false;
		_originalDotColour = _dot.color;
	}

	void LateUpdate()
	{
		transform.Rotate(Vector3.forward * -40 * Time.deltaTime);
	}

	public void DetectTargets(Ray ray)
	{
		if (Physics.Raycast(ray, 1000, _targetMask, QueryTriggerInteraction.Collide))
		{
			_dot.color = _dotHighlightColour;
		}
		else
		{
			_dot.color = _originalDotColour;
		}
	}
}