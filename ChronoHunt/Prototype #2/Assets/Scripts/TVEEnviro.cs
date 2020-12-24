using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TheVegetationEngine;

public class TVEEnviro : MonoBehaviour
{

    public bool setWindZone;
    public bool updateWetness;
    public bool updateSeasons;
    public bool updateSnowOrOverlay;

    private float daysInYear;

    private float Season;

    [Header("View Only")]
    [Range(0F, 1F)]
    public float curentWind;
    [Range(-1F, 1F)]
    public float curentWet;
    [Range(0f, 4F)]
    public float curentSeason;
    [Range(0f, 1F)]
    public float curentSnow;


    private TVEGlobalMotion GetTVEGlobalMotion;
    private TVEGlobalWetness GetTVEGlobalWetness;
    private TVEGlobalSeasons GetTVEGlobalSeasons;
    private TVEGlobalOverlay GetTVEGlobalOverlay;

    private void Start()
    {
        GetTVEGlobalMotion = GameObject.Find("Global Motion").GetComponent<TVEGlobalMotion>();
        GetTVEGlobalWetness = GameObject.Find("Global Wetness").GetComponent<TVEGlobalWetness>();
        GetTVEGlobalSeasons = GameObject.Find("Global Seasons").GetComponent<TVEGlobalSeasons>();
        GetTVEGlobalOverlay = GameObject.Find("Global Overlay").GetComponent<TVEGlobalOverlay>();

        daysInYear = EnviroSkyMgr.instance.Time.DaysInYear;

        curentWind = EnviroSkyMgr.instance.Components.windZone.windMain;
        curentWet = EnviroSkyMgr.instance.GetWetnessIntensity();
        curentSeason = Mathf.Lerp(0f, 4f, EnviroSkyMgr.instance.GetCurrentDay() / daysInYear);
        curentSnow = EnviroSkyMgr.instance.Weather.snowStrength;

        if (setWindZone)
        {
            GetTVEGlobalMotion.windPower = EnviroSkyMgr.instance.Components.windZone.windMain;
        }
        if (updateWetness)
        {
            GetTVEGlobalWetness.wetness = EnviroSkyMgr.instance.GetWetnessIntensity();
        }
        if (updateSeasons)
        {
            GetTVEGlobalSeasons.season = Mathf.Lerp(0f, 4f, EnviroSkyMgr.instance.GetCurrentDay() / daysInYear);
        }
        if (updateSnowOrOverlay)
        {
            GetTVEGlobalOverlay.overlayIntensity = EnviroSkyMgr.instance.Weather.snowStrength;
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (setWindZone)
        {
            if (EnviroSkyMgr.instance.Components.windZone.windMain != curentWind)
            {
                GetTVEGlobalMotion.windPower = EnviroSkyMgr.instance.Components.windZone.windMain;

                curentWind = EnviroSkyMgr.instance.Components.windZone.windMain;
            }
        }

        if (updateWetness)
        {
            if (EnviroSkyMgr.instance.GetWetnessIntensity() != curentWet)
            {
                GetTVEGlobalWetness.wetness = EnviroSkyMgr.instance.GetWetnessIntensity();

                curentWet = EnviroSkyMgr.instance.GetWetnessIntensity();
            }
        }
        if (updateSeasons)
        {
            if (Mathf.Lerp(0f, 4f, EnviroSkyMgr.instance.GetCurrentDay() / daysInYear) != curentSeason)
            {
                GetTVEGlobalSeasons.season = Mathf.Lerp(0f, 4f, EnviroSkyMgr.instance.GetCurrentDay() / daysInYear);

                curentSeason = Mathf.Lerp(0f, 4f, EnviroSkyMgr.instance.GetCurrentDay() / daysInYear);
            }
        }
        if (updateSnowOrOverlay)
        {
            if (EnviroSkyMgr.instance.Weather.snowStrength != curentSnow)
            {
                GetTVEGlobalOverlay.overlayIntensity = EnviroSkyMgr.instance.Weather.snowStrength;
                curentSnow = EnviroSkyMgr.instance.Weather.snowStrength;
            }
        }
    }
}