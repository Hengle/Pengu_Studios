using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    public GameObject mainCam;
    public GameObject aimCam;
    public PlayerController controller;
    public void Fight()
    {
        mainCam.SetActive(false);
        aimCam.SetActive(true);
    }
    public void ResetCam()
    {
        aimCam.SetActive(false);
        mainCam.SetActive(true);
    }
}
