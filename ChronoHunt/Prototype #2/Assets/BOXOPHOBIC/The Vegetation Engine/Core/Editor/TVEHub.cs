// Cristian Pop - https://boxophobic.com/

using UnityEngine;
using UnityEditor;
using Boxophobic.StyledGUI;
using Boxophobic.Utils;
using System.IO;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEditor.SceneManagement;

namespace TheVegetationEngine
{
    public class TVEHub : EditorWindow
    {
#if UNITY_2019_3_OR_NEWER
        const int GUI_HEIGHT = 18;
#else
        const int GUI_HEIGHT = 14;
#endif
        string[] engineVegetationStudio = new string[]
        {
        "           //Vegetation Studio (Instanced Indirect)",
        "           #include \"XXX/Core/Library/VS_Indirect.cginc\"",
        "           #pragma instancing_options procedural:setup forwardadd",
        "           #pragma multi_compile GPU_FRUSTUM_ON __",
        };

        string[] engineVegetationStudioHD = new string[]
        {
        "           //Vegetation Studio (Instanced Indirect)",
        "           #include \"XXX/Core/Library/VS_IndirectHD.cginc\"",
        "           #pragma instancing_options procedural:setupVSPro forwardadd",
        "           #pragma multi_compile GPU_FRUSTUM_ON __",
        };

        string[] engineGPUInstancer = new string[]
        {
        "           //GPU Instancer (Instanced Indirect)",
        "           #include \"XXX\"",
        "           #pragma instancing_options procedural:setupGPUI",
        "           #pragma multi_compile_instancing",
        };

        string[] engineNatureRenderer = new string[]
        {
        "           //Nature Renderer (Procedural Instancing)",
        "           #include \"XXX\"",
        "           #pragma instancing_options procedural:SetupNatureRenderer",
        };

        readonly string[] engineOptions =
        {
        "Unity Default Renderer",
        "Nature Renderer (Procedural Instancing)",
        "Vegetation Studio (Instanced Indirect)",
        "GPU Instancer (Instanced Indirect)",
        };

        string coreFolder = "Assets/BOXOPHOBIC/The Vegetation Engine";
        string userFolder = "Assets/BOXOPHOBIC/User";

        string[] corePackagePaths;
        string[] corePackageOptions;

        string[] allMaterialGUIDs;
        List<string> coreShaderPaths;
        List<int> engineOverridesIndices;

        string aciveScene = "";
        string corePackagesPath;

        int corePackageIndex = 0;
        int coreEngineIndex = 0;

        int coreVersion;
        int userVersion;
        int unityMajorVersion;

        bool upgradeIsNeeded = false;
        bool packageIsImported = false;
        bool rendererOverrides = false;
        bool rendererOverridesOld = false;

        GUIStyle stylePopup;
        GUIStyle styleLabel;

        Color bannerColor;
        string bannerText;
        string bannerVersion;
        string helpURL;
        static TVEHub window;
        Vector2 scrollPosition = Vector2.zero;

        [MenuItem("Window/BOXOPHOBIC/The Vegetation Engine/Hub", false, 1000)]
        public static void ShowWindow()
        {
            window = GetWindow<TVEHub>(false, "The Vegetation Engine Hub", true);
            window.minSize = new Vector2(389, 220);
        }

        void OnEnable()
        {
            //Safer search, there might be many user folders
            string[] searchFolders;

            searchFolders = AssetDatabase.FindAssets("The Vegetation Engine");

            for (int i = 0; i < searchFolders.Length; i++)
            {
                if (AssetDatabase.GUIDToAssetPath(searchFolders[i]).EndsWith("The Vegetation Engine.pdf"))
                {
                    coreFolder = AssetDatabase.GUIDToAssetPath(searchFolders[i]);
                    coreFolder = coreFolder.Replace("/The Vegetation Engine.pdf", "");
                }
            }

            searchFolders = AssetDatabase.FindAssets("User");

            for (int i = 0; i < searchFolders.Length; i++)
            {
                if (AssetDatabase.GUIDToAssetPath(searchFolders[i]).EndsWith("User.pdf"))
                {
                    userFolder = AssetDatabase.GUIDToAssetPath(searchFolders[i]);
                    userFolder = userFolder.Replace("/User.pdf", "");
                    userFolder = userFolder + "/The Vegetation Engine/";
                }
            }

            var cgincGPUI = "Assets/GPUInstancer/Shaders/Include/GPUInstancerInclude.cginc";

            searchFolders = AssetDatabase.FindAssets("GPUInstancerInclude");

            for (int i = 0; i < searchFolders.Length; i++)
            {
                if (AssetDatabase.GUIDToAssetPath(searchFolders[i]).EndsWith("GPUInstancerInclude.cginc"))
                {
                    cgincGPUI = AssetDatabase.GUIDToAssetPath(searchFolders[i]);
                }
            }

            var cgincNR = "Assets/Visual Design Cafe/Nature Shaders/Common/Nodes/Integrations/Nature Renderer.cginc";

            searchFolders = AssetDatabase.FindAssets("Nature Renderer");

            for (int i = 0; i < searchFolders.Length; i++)
            {
                if (AssetDatabase.GUIDToAssetPath(searchFolders[i]).EndsWith("Nature Renderer.cginc"))
                {
                    cgincNR = AssetDatabase.GUIDToAssetPath(searchFolders[i]);
                }
            }

            // Add corect paths for VSP and GPUI
            engineVegetationStudio[1] = engineVegetationStudio[1].Replace("XXX", coreFolder);
            engineVegetationStudioHD[1] = engineVegetationStudioHD[1].Replace("XXX", coreFolder);
            engineGPUInstancer[1] = engineGPUInstancer[1].Replace("XXX", cgincGPUI);
            engineNatureRenderer[1] = engineNatureRenderer[1].Replace("XXX", cgincNR);

            corePackagesPath = coreFolder + "/Core/Packages";

            GetPackages();
            GetCoreShaders();

            GetAllMaterialGUIDs();

            // GetUser Settings
            if (File.Exists(userFolder + "Asset Version.asset"))
            {
                SettingsUtils.SaveSettingsData(userFolder + "Version.asset", SettingsUtils.LoadSettingsData(userFolder + "Asset Version.asset", -99));
                FileUtil.DeleteFileOrDirectory(userFolder + "Asset Version.asset");
                AssetDatabase.SaveAssets();
                AssetDatabase.Refresh();
            }

            if (File.Exists(userFolder + "Asset Settings.asset"))
            {
                FileUtil.DeleteFileOrDirectory(userFolder + "Asset Settings.asset");
                AssetDatabase.SaveAssets();
                AssetDatabase.Refresh();
            }

            if (File.Exists(userFolder + "Asset Pipeline.asset"))
            {
                FileUtil.DeleteFileOrDirectory(userFolder + "Asset Pipeline.asset");
                AssetDatabase.SaveAssets();
                AssetDatabase.Refresh();
            }

            if (File.Exists(userFolder + "Shader Compatibility.asset"))
            {
                FileUtil.DeleteFileOrDirectory(userFolder + "Shader Compatibility.asset");
                AssetDatabase.SaveAssets();
                AssetDatabase.Refresh();
            }

            coreVersion = SettingsUtils.LoadSettingsData(coreFolder + "/Core/Editor/TVEVersion.asset", -99);
            userVersion = SettingsUtils.LoadSettingsData(userFolder + "Version.asset", -99);
            unityMajorVersion = int.Parse(Application.unityVersion.Substring(0, 4));

            if (userVersion == -99)
            {
                // Looks like new install, but User folder might be deleted so check for TVE materials
                for (int i = 0; i < allMaterialGUIDs.Length; i++)
                {
                    var path = AssetDatabase.GUIDToAssetPath(allMaterialGUIDs[i]);

                    // Exclude TVE folder when checking
                    if (path.Contains("TVE Material") && path.Contains("The Vegetation Engine") == false)
                    {
                        upgradeIsNeeded = true;
                        break;
                    }
                }
            }

            // User Version exist and need upgrade
            if (userVersion != -99 && userVersion < coreVersion)
            {
                upgradeIsNeeded = true;
            }

            // Curent version was installed but deleted and reimported
            if (userVersion == coreVersion)
            {
                upgradeIsNeeded = false;
            }

            for (int i = 0; i < corePackageOptions.Length; i++)
            {
                if (corePackageOptions[i] == SettingsUtils.LoadSettingsData(userFolder + "Pipeline.asset", ""))
                {
                    corePackageIndex = i;
                }
            }

            for (int i = 0; i < engineOptions.Length; i++)
            {
                if (engineOptions[i] == SettingsUtils.LoadSettingsData(userFolder + "Engine.asset", ""))
                {
                    coreEngineIndex = i;
                }
            }

            bannerVersion = coreVersion.ToString();
            bannerVersion = bannerVersion.Insert(1, ".");
            bannerVersion = bannerVersion.Insert(3, ".");

            bannerColor = new Color(0.890f, 0.745f, 0.309f);
            bannerText = "The Vegetation Engine " + bannerVersion;
            helpURL = "https://docs.google.com/document/d/145JOVlJ1tE-WODW45YoJ6Ixg23mFc56EnB_8Tbwloz8/edit#heading=h.pr0qp2u684tr";

            // Check for latest version
            //StartBackgroundTask(StartRequest("https://boxophobic.com/s/thevegetationengine", () =>
            //{
            //    int.TryParse(www.downloadHandler.text, out latestVersion);
            //    Debug.Log("hubhub" + latestVersion);
            //}));
        }

        void OnGUI()
        {
            SetGUIStyles();

            StyledGUI.DrawWindowBanner(bannerColor, bannerText, helpURL);

            GUILayout.BeginHorizontal();
            GUILayout.Space(15);

            GUILayout.BeginVertical();

            scrollPosition = GUILayout.BeginScrollView(scrollPosition, false, false, GUILayout.Width(this.position.width - 28), GUILayout.Height(this.position.height - 80));

            if (File.Exists(coreFolder + "/Core/Editor/TVEHubAutoRun.cs"))
            {
                if (upgradeIsNeeded)
                {
                    EditorGUILayout.HelpBox("Previous version detected! The Vegetation Engine will check all project materials and upgrade them if needed. " +
                                            "Make sure you read the Upgrading Steps to upgrade to a new version. Do not close Unity during the upgrade!", MessageType.Info, true);

                    GUILayout.Space(15);

                    if (GUILayout.Button("Upgrade Materials And Install", GUILayout.Height(24)))
                    {
                        UpgradeAsset();
                        InstallAsset();
                    }
                }
                else
                {
                    EditorGUILayout.HelpBox("Welcome to the Vegetation Engine! The installer will set up the asset and prepare the shaders for the current Unity version!", MessageType.Info, true);

                    GUILayout.Space(15);

                    if (GUILayout.Button("Install", GUILayout.Height(24)))
                    {
                        InstallAsset();
                    }
                }
            }
            // TVE is installed
            else
            {
                if (packageIsImported)
                {
                    EditorGUILayout.HelpBox("The Render Pipeline is not yet installed! Choose and Install the desired Render Engine to finish the setup!", MessageType.Warning, true);
                }
                else
                {
                    EditorGUILayout.HelpBox("Click the Render Pipeline Import button then click the Render Engine Install button to use The Vegetation Engine with another render pipeline. Click the Render Engine Install button to update the shader render engine only. The selected features are shared across all TVE shaders. Enable Render Engine Overrides to select per shader Render Engine.", MessageType.Info, true);
                }

                GUILayout.Space(15);

                GUILayout.BeginHorizontal();

                GUILayout.Label("Render Pipeline", GUILayout.Width(220));
                corePackageIndex = EditorGUILayout.Popup(corePackageIndex, corePackageOptions, stylePopup);

                if (GUILayout.Button("Import", GUILayout.Width(80), GUILayout.Height(GUI_HEIGHT)))
                {
                    SettingsUtils.SaveSettingsData(userFolder + "Pipeline.asset", corePackageOptions[corePackageIndex]);

                    SetDefineSymbols(corePackageOptions[corePackageIndex]);
                    ImportPackage();

                    packageIsImported = true;

                    GUIUtility.ExitGUI();
                }

                GUILayout.EndHorizontal();

                GUILayout.BeginHorizontal();
                GUILayout.Label("Render Engine", GUILayout.Width(220));
                coreEngineIndex = EditorGUILayout.Popup(coreEngineIndex, engineOptions, stylePopup);

                if (GUILayout.Button("Install", GUILayout.Width(80), GUILayout.Height(GUI_HEIGHT)))
                {
                    SettingsUtils.SaveSettingsData(userFolder + "Engine.asset", engineOptions[coreEngineIndex]);

                    UpdateShaders();

                    if (packageIsImported)
                    {
                        SetMaterialSettings();
                    }

                    // Refresh overrides if opened
                    rendererOverridesOld = false;
                    packageIsImported = false;

                    GUIUtility.ExitGUI();
                }

                GUILayout.EndHorizontal();

                GUILayout.Space(10);

                GUILayout.BeginHorizontal();

                GUILayout.Label("Show Advanced Options", GUILayout.Width(220));
                rendererOverrides = EditorGUILayout.Toggle(rendererOverrides);

                GUILayout.EndHorizontal();

                if (rendererOverrides == true)
                {
                    if (rendererOverridesOld != rendererOverrides)
                    {
                        for (int i = 0; i < coreShaderPaths.Count; i++)
                        {
                            GetRenderEngineFromShader(coreShaderPaths[i], i);
                        }

                        rendererOverridesOld = rendererOverrides;
                    }

                    GUILayout.Space(10);

                    EditorGUILayout.HelpBox("Use this section to override the installed Render Engine compatibility.", MessageType.Info, true);

                    GUILayout.Space(10);

                    for (int i = 0; i < coreShaderPaths.Count; i++)
                    {
                        GUILayout.BeginHorizontal();

                        GUILayout.Label(Path.GetFileNameWithoutExtension(coreShaderPaths[i]), GUILayout.Width(220));
                        engineOverridesIndices[i] = EditorGUILayout.Popup(engineOverridesIndices[i], engineOptions, stylePopup);

                        if (GUILayout.Button("Install", GUILayout.Width(80), GUILayout.Height(GUI_HEIGHT)))
                        {
                            InjectShaderFeature(coreShaderPaths[i], engineOptions[engineOverridesIndices[i]]);
                            //AssetDatabase.SaveAssets();
                            //AssetDatabase.Refresh();

                            SettingsUtils.SaveSettingsData(userFolder + "Engine.asset", "Mixed Render Engines");
                            GUIUtility.ExitGUI();
                        }

                        GUILayout.EndHorizontal();
                    }
                }

                GUILayout.FlexibleSpace();
                GUI.enabled = false;

                GUILayout.Space(20);

                if (!packageIsImported)
                {
                    GUILayout.Label("<color=#7f7f7f><size=10><b>Imported Render Pipeline: " + SettingsUtils.LoadSettingsData(userFolder + "Pipeline.asset", "Standard") + "</b></size></color>", styleLabel);
                    GUILayout.Label("<color=#7f7f7f><size=10><b>Installed Render Engine: " + SettingsUtils.LoadSettingsData(userFolder + "Engine.asset", "Unity Default Renderer") + "</b></size></color>", styleLabel);
                }

                GUILayout.Space(20);
            }

            GUILayout.EndScrollView();

            GUILayout.EndVertical();

            GUILayout.Space(13);
            GUILayout.EndHorizontal();
        }

        void SetGUIStyles()
        {
            stylePopup = new GUIStyle(EditorStyles.popup)
            {
                alignment = TextAnchor.MiddleCenter
            };

            styleLabel = new GUIStyle(EditorStyles.label)
            {
                richText = true,
                alignment = TextAnchor.MiddleCenter,
            };

            //styleButton = new GUIStyle(GUI.skin.GetStyle("Button"))
            //{
            //    richText = true,
            //    alignment = TextAnchor.MiddleCenter,
            //};
        }

        int StyledBool(string name, int value)
        {
            bool boolValue = false;

            if (value == 1)
            {
                boolValue = true;
            }

            GUILayout.BeginHorizontal();
            EditorGUILayout.LabelField(new GUIContent(name, ""));
            boolValue = EditorGUILayout.Toggle(boolValue, GUILayout.Width(14));
            GUILayout.EndHorizontal();

            if (boolValue == false)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }

        void InstallAsset()
        {
            RestartActiveScene();
            UpdateShaders();

            SettingsUtils.SaveSettingsData(userFolder + "Version.asset", coreVersion);
            SettingsUtils.SaveSettingsData(userFolder + "Pipeline.asset", "Standard");
            SettingsUtils.SaveSettingsData(userFolder + "Engine.asset", engineOptions[coreEngineIndex]);

            FileUtil.DeleteFileOrDirectory(coreFolder + "/Core/Editor/TVEHubAutorun.cs");
            AssetDatabase.Refresh();

            SetDefineSymbols("Standard");
            SetScriptExecutionOrder();

            Debug.Log("[The Vegetation Engine] " + "The Vegetation Engine " + bannerVersion + " is installed!");

            GUIUtility.ExitGUI();
        }

        void UpgradeAsset()
        {
            if (userVersion < 200)
            {
                int length = allMaterialGUIDs.Length;
                int count = 0;

                foreach (var asset in allMaterialGUIDs)
                {
                    var path = AssetDatabase.GUIDToAssetPath(asset);
                    var message = "Checking ";

                    if (path.Contains("TVE Material"))
                    {
                        var material = AssetDatabase.LoadAssetAtPath<Material>(path);
                        TVEShaderUtils.UpgradeMaterialTo200(material);
                        TVEShaderUtils.SetMaterialSettings(material);
                        message = "Upgrading ";
                    }
                    else if (path.Contains("TVE Element"))
                    {
                        var material = AssetDatabase.LoadAssetAtPath<Material>(path);
                        TVEShaderUtils.UpgradeElementTo200(material);
                        message = "Upgrading ";
                    }

                    EditorUtility.DisplayProgressBar("The Vegetatin Engine", message + Path.GetFileName(path), (float)count * (1.0f / (float)length));

                    count++;
                }

                EditorUtility.ClearProgressBar();
            }

            Debug.Log("[The Vegetation Engine] " + "The Vegetation Engine materials have been upgraded to version " + bannerVersion);
        }

        void GetPackages()
        {
            corePackagePaths = Directory.GetFiles(corePackagesPath, "*.unitypackage", SearchOption.TopDirectoryOnly);

            corePackageOptions = new string[corePackagePaths.Length];

            for (int i = 0; i < corePackageOptions.Length; i++)
            {
                corePackageOptions[i] = Path.GetFileNameWithoutExtension(corePackagePaths[i].Replace("Built-in Pipeline", "Standard"));
            }
        }

        void GetCoreShaders()
        {
            coreShaderPaths = new List<string>();
            engineOverridesIndices = new List<int>();

            var allShaderPaths = Directory.GetFiles("Assets/", "*.shader", SearchOption.AllDirectories);

            for (int i = 0; i < allShaderPaths.Length; i++)
            {
                // No direct path usage to awoid Windows/Mac slash convention issues
                if (allShaderPaths[i].Contains("The Vegetation Engine") || allShaderPaths[i].Contains("TVE Shader"))
                {
                    if (allShaderPaths[i].Contains("Elements") == false &&
                        allShaderPaths[i].Contains("Helpers") == false &&
                        allShaderPaths[i].Contains("Legacy") == false &&
                        allShaderPaths[i].Contains("Tools") == false &&
                        allShaderPaths[i].Contains("The Vegetation Engine Details") == false)
                    {
                        // Auto generated GPUI Shaders need to be removed to avoid issues
                        if (allShaderPaths[i].Contains("GPUI"))
                        {
                            FileUtil.DeleteFileOrDirectory(allShaderPaths[i]);
                            AssetDatabase.Refresh();
                        }
                        else
                        {
                            coreShaderPaths.Add(allShaderPaths[i]);
                            engineOverridesIndices.Add(0);
                        }
                    }
                }
            }
        }

        void GetAllMaterialGUIDs()
        {
            allMaterialGUIDs = AssetDatabase.FindAssets("t:material", null);
        }

        void SetMaterialSettings()
        {
            int length = allMaterialGUIDs.Length;
            int count = 0;

            foreach (var asset in allMaterialGUIDs)
            {
                var path = AssetDatabase.GUIDToAssetPath(asset);
                var message = "Checking ";

                if (path.Contains("TVE Material"))
                {
                    var material = AssetDatabase.LoadAssetAtPath<Material>(path);
                    TVEShaderUtils.SetMaterialSettings(material);
                }

                EditorUtility.DisplayProgressBar("The Vegetatin Engine", message + Path.GetFileName(path), (float)count * (1.0f / (float)length));
            }

            EditorUtility.ClearProgressBar();
        }

        void RestartActiveScene()
        {
            if (SceneManager.GetActiveScene().name != "")
            {
                aciveScene = SceneManager.GetActiveScene().path;
                EditorSceneManager.NewScene(NewSceneSetup.EmptyScene);
                EditorSceneManager.OpenScene(aciveScene);
            }
        }

        void ImportPackage()
        {
            AssetDatabase.ImportPackage(corePackagePaths[corePackageIndex], false);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();

            Debug.Log("[The Vegetation Engine] " + corePackageOptions[corePackageIndex] + " package imported!");
        }

        void UpdateShaders()
        {
            for (int i = 0; i < coreShaderPaths.Count; i++)
            {
                InjectShaderFeature(coreShaderPaths[i], engineOptions[coreEngineIndex]);
            }

            Debug.Log("[The Vegetation Engine] " + "Shader features updated!");

            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();
        }

        void GetRenderEngineFromShader(string shaderAssetPath, int index)
        {
            StreamReader reader = new StreamReader(shaderAssetPath);

            string lines = reader.ReadToEnd();

            for (int i = 0; i < engineOptions.Length; i++)
            {
                if (lines.Contains(engineOptions[i]))
                {
                    engineOverridesIndices[index] = i;
                }
            }

            reader.Close();
        }

        void InjectShaderFeature(string shaderAssetPath, string renderEngine)
        {
            StreamReader reader = new StreamReader(shaderAssetPath);

            List<string> lines = new List<string>();

            while (!reader.EndOfStream)
            {
                lines.Add(reader.ReadLine());
            }

            reader.Close();

            // Delete Features before adding new ones
            int count = lines.Count;

            for (int i = 0; i < count; i++)
            {
                if (lines[i].Contains("SHADER INJECTION POINT BEGIN"))
                {
                    int c = 0;
                    int j = i + 1;

                    while (lines[j].Contains("SHADER INJECTION POINT END") == false)
                    {
                        j++;
                        c++;
                    }

                    lines.RemoveRange(i + 1, c);
                    count = count - c;
                }
            }

            var pipeline = SettingsUtils.LoadSettingsData(userFolder + "Pipeline.asset", "Standard");

            // Delete GPUI added lines    
            count = lines.Count;

            if (pipeline.Contains("Standard"))
            {
                for (int i = 0; i < count; i++)
                {
                    if (lines[i].StartsWith("#"))
                    {
                        lines.RemoveRange(i + 1, 4);
                        count = count - 4;

                        i--;
                    }

                    if (lines[i].Contains("#pragma target 3.0"))
                    {
                        if (lines[i + 1].Contains("multi_compile_instancing") == false)
                        {
                            lines.Insert(i + 1, "		#pragma multi_compile_instancing");
                        }
                    }
                }
            }
            else if (pipeline.Contains("Universal"))
            {
                for (int i = 0; i < count; i++)
                {
                    if (lines[i].StartsWith("#"))
                    {
                        lines.RemoveRange(i, 3);
                        count = count - 3;

                        i--;
                    }

                    if (lines[i].Contains("HLSLPROGRAM"))
                    {
                        if (lines[i + 1].Contains("multi_compile_instancing") == false)
                        {
                            lines.Insert(i + 1, "		    #pragma multi_compile_instancing");
                        }
                    }
                }
            }
            else if (pipeline.Contains("High"))
            {
                for (int i = 0; i < count; i++)
                {
                    if (lines[i].StartsWith("#"))
                    {
                        lines.RemoveRange(i, 3);
                        count = count - 3;

                        i--;
                    }

                    if (lines[i].Contains("HLSLINCLUDE"))
                    {
                        if (lines[i + 3].Contains("multi_compile_instancing") == false)
                        {
                            lines.Insert(i + 3, "		    #pragma multi_compile_instancing");
                        }
                    }
                }
            }

            for (int i = 0; i < count; i++)
            {
                if (lines[i].Contains("GPUInstancerInclude.cginc"))
                {
                    if (pipeline.Contains("Standard"))
                    {
                        lines.RemoveAt(i - 1);
                        lines.RemoveAt(i);
                        lines.RemoveAt(i + 1);
                    }

                    count = count - 3;
                }
            }

            //Inject 3rd Party Support
            if (renderEngine.Contains("GPU Instancer"))
            {
                for (int i = 0; i < lines.Count; i++)
                {
                    if (lines[i].Contains("SHADER INJECTION POINT BEGIN"))
                    {
                        lines.InsertRange(i + 1, engineGPUInstancer);
                    }
                }
            }

            else if (renderEngine.Contains("Vegetation Studio"))
            {
                for (int i = 0; i < lines.Count; i++)
                {
                    if (lines[i].Contains("SHADER INJECTION POINT BEGIN"))
                    {
                        if (pipeline.Contains("High"))
                        {
                            lines.InsertRange(i + 1, engineVegetationStudioHD);
                        }
                        else
                        {
                            lines.InsertRange(i + 1, engineVegetationStudio);
                        }
                    }
                }
            }

            else if (renderEngine.Contains("Nature Renderer"))
            {
                for (int i = 0; i < lines.Count; i++)
                {
                    if (lines[i].Contains("SHADER INJECTION POINT BEGIN"))
                    {
                        lines.InsertRange(i + 1, engineNatureRenderer);
                    }
                }
            }

            for (int i = 0; i < lines.Count; i++)
            {
                // Disable Universal define set by ASE
                if (lines[i].Contains("_ALPHATEST_ON 1"))
                {
                    lines[i] = lines[i].Replace("_ALPHATEST_ON 1", "TVE_DISABLE_ALPHATEST_ON 1");
                }

                // Disable ASE Drawers
                if (lines[i].Contains("[ASEBegin]"))
                {
                    lines[i] = lines[i].Replace("[ASEBegin]", "");
                }

                if (lines[i].Contains("[ASEnd]"))
                {
                    lines[i] = lines[i].Replace("[ASEnd]", "");
                }

                // Change Property Names
                if (shaderAssetPath.Contains("Grass Standard Lit") || shaderAssetPath.Contains("Grass Subsurface Lit"))
                {
                    if (lines[i].Contains("Colors Use Mask") && !lines[i].Contains("mask"))
                    {
                        lines[i] = lines[i].Replace("Colors Use Mask", "Colors Use Mask (bottom mask)");
                    }

                    if (lines[i].Contains("Subsurface Use Mask") && !lines[i].Contains("mask"))
                    {
                        lines[i] = lines[i].Replace("Subsurface Use Mask", "Subsurface Use Mask (top mask)");
                    }
                }

                if (shaderAssetPath.Contains("Leaf Standard Lit") || shaderAssetPath.Contains("Leaf Subsurface Lit") || shaderAssetPath.Contains("Cross Standard Lit") || shaderAssetPath.Contains("Cross Subsurface Lit"))
                {
                    if (lines[i].Contains("Colors Use Mask") && !lines[i].Contains("mask"))
                    {
                        lines[i] = lines[i].Replace("Colors Use Mask", "Colors Use Mask (main mask)");
                    }

                    if (lines[i].Contains("Subsurface Use Mask") && !lines[i].Contains("mask"))
                    {
                        lines[i] = lines[i].Replace("Subsurface Use Mask", "Subsurface Use Mask (main mask)");
                    }
                }

                // Set keyword to global for unity < 2019
                if (unityMajorVersion < 2019)
                {
                    if (lines[i].Contains("shader_feature_local _ALPHATEST_ON"))
                    {
                        lines[i] = lines[i].Replace("shader_feature_local _ALPHATEST_ON", "shader_feature _ALPHATEST_ON");
                    }

                    if (lines[i].Contains("shader_feature_local TVE_DETAIL_MODE_OFF"))
                    {
                        lines[i] = lines[i].Replace("shader_feature_local TVE_DETAIL_MODE_OFF", "shader_feature TVE_DETAIL_MODE_OFF");
                    }

                    if (lines[i].Contains("shader_feature_local TVE_DETAIL_MAPS_STANDARD"))
                    {
                        lines[i] = lines[i].Replace("shader_feature_local TVE_DETAIL_MAPS_STANDARD", "shader_feature TVE_DETAIL_MAPS_STANDARD");
                    }

                    if (lines[i].Contains("shader_feature_local TVE_DETAIL_TYPE_VERTEX_BLUE"))
                    {
                        lines[i] = lines[i].Replace("shader_feature_local TVE_DETAIL_TYPE_VERTEX_BLUE", "shader_feature TVE_DETAIL_TYPE_VERTEX_BLUE");
                    }

                    if (lines[i].Contains("shader_feature_local TVE_VERTEX_DATA_OBJECT"))
                    {
                        lines[i] = lines[i].Replace("shader_feature_local TVE_VERTEX_DATA_OBJECT", "shader_feature TVE_VERTEX_DATA_OBJECT");
                    }
                }
            }

#if AMPLIFY_SHADER_EDITOR

            // Add diffusion profile support
            if (pipeline.Contains("High"))
            {
                if (shaderAssetPath.Contains("Subsurface Lit"))
                {
                    for (int i = 0; i < lines.Count; i++)
                    {
                        if (lines[i].Contains("ASEDiffusionProfile"))
                        {
                            lines[i] = lines[i].Replace("[HideInInspector][ASEDiffusionProfile(_SubsurfaceDiffusion)]", "[ASEDiffusionProfile(_SubsurfaceDiffusion)]");
                        }

                        if (lines[i].Contains("StyledDiffusionMaterial"))
                        {
                            lines[i] = lines[i].Replace("[StyledDiffusionMaterial(_SubsurfaceDiffusion)]", "[HideInInspector][StyledDiffusionMaterial(_SubsurfaceDiffusion)]");
                        }
                    }
                }
            }
#endif

            StreamWriter writer = new StreamWriter(shaderAssetPath);

            for (int i = 0; i < lines.Count; i++)
            {
                writer.WriteLine(lines[i]);
            }

            writer.Close();

            lines = new List<string>();

            //AssetDatabase.ImportAsset(shaderAssetPath);
        }

        void SetDefineSymbols(string pipeline)
        {
            var defineSymbols = PlayerSettings.GetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup);

            // Cleanup
            defineSymbols = defineSymbols.Replace("THE_VEGETATION_ENGINE_STANDARD", "");
            defineSymbols = defineSymbols.Replace("THE_VEGETATION_ENGINE_UNIVERSAL", "");
            defineSymbols = defineSymbols.Replace("THE_VEGETATION_ENGINE_HD", "");
            defineSymbols = defineSymbols.Replace("THE_VEGETATION_ENGINE", "");

            defineSymbols = defineSymbols + ";THE_VEGETATION_ENGINE;";

            var define = "";

            if (pipeline.Contains("Standard"))
            {
                define = "THE_VEGETATION_ENGINE_STANDARD";
            }
            else if (pipeline.Contains("Universal"))
            {
                define = "THE_VEGETATION_ENGINE_UNIVERSAL";
            }

            else if (pipeline.Contains("High"))
            {
                define = "THE_VEGETATION_ENGINE_HD";
            }
            else if (pipeline == "")
            {
                define = "THE_VEGETATION_ENGINE_STANDARD";
            }

            defineSymbols = defineSymbols + ";" + define + ";";

            PlayerSettings.SetScriptingDefineSymbolsForGroup(EditorUserBuildSettings.selectedBuildTargetGroup, defineSymbols);
        }

        void SetScriptExecutionOrder()
        {
            MonoScript[] scripts = (MonoScript[])Resources.FindObjectsOfTypeAll(typeof(MonoScript));
            foreach (MonoScript script in scripts)
            {
                if (script.GetClass() == typeof(TVEElement))
                {
                    MonoImporter.SetExecutionOrder(script, 122);
                }
            }
        }

        // Check for latest version
        //UnityWebRequest www;

        //IEnumerator StartRequest(string url, Action success = null)
        //{
        //    using (www = UnityWebRequest.Get(url))
        //    {
        //        yield return www.Send();

        //        while (www.isDone == false)
        //            yield return null;

        //        if (success != null)
        //            success();
        //    }
        //}

        //public static void StartBackgroundTask(IEnumerator update, Action end = null)
        //{
        //    EditorApplication.CallbackFunction closureCallback = null;

        //    closureCallback = () =>
        //    {
        //        try
        //        {
        //            if (update.MoveNext() == false)
        //            {
        //                if (end != null)
        //                    end();
        //                EditorApplication.update -= closureCallback;
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            if (end != null)
        //                end();
        //            Debug.LogException(ex);
        //            EditorApplication.update -= closureCallback;
        //        }
        //    };

        //    EditorApplication.update += closureCallback;
        //}
    }
}
