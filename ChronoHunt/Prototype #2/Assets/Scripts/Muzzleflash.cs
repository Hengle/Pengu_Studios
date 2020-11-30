using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Muzzleflash : MonoBehaviour
{
    [SerializeField] GameObject _flashHolder;
    [SerializeField] Sprite[] _flashSprites;
    [SerializeField] SpriteRenderer[] _spriteRenderers;
    [SerializeField] float _flashTime;

    private void Start()
    {
        Deactivate();
    }
    public void Activate()
    {
        _flashHolder.SetActive(true);
        int _flashSpriteIndex = Random.Range(0, _flashSprites.Length);
        for (int i = 0; i < _spriteRenderers.Length; i++)
        {
            _spriteRenderers[i].sprite = _flashSprites[_flashSpriteIndex];
        }

        Invoke("Deactivate", _flashTime);
    }

    void Deactivate()
    {
        _flashHolder.SetActive(false);
    }
}
