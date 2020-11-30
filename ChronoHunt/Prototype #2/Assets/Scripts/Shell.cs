using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Shell : MonoBehaviour
{
    [SerializeField] Rigidbody _rb;
    [SerializeField] float _forceMin;
    [SerializeField] float _forceMax;

    float lifeTime = 4;
    float fadeTime = 2;
    // Start is called before the first frame update
    void Start()
    {
        float force = Random.Range(_forceMin, _forceMax);
        _rb.AddForce(transform.right * force);
        _rb.AddTorque(Random.insideUnitSphere * force);
        StartCoroutine(Fade());
    }

    IEnumerator Fade()
    {
        yield return new WaitForSeconds(lifeTime);

        float _percent = 0;
        float _fadeSpeed = 1 / fadeTime;
        Material _mat = GetComponent<Renderer>().material;
        Color initialColor = _mat.color;

        while (_percent < 1)
        {
            _percent += Time.deltaTime * _fadeSpeed;
            _mat.color = Color.Lerp(initialColor, Color.clear, _percent);
            yield return null;
        }

        Destroy(gameObject);
    }
}
