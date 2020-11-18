using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Spawner : MonoBehaviour
{
    public Enemies[] enemies;
    public Enemy enemy;

    Enemies currentEnemy;
    int currentEnemyNumber;

    int enemiesRemainingToSpawn;
    int enemiesRemainingAlive;
    float nextSpawnTime;

    void Start()
    {
        NextEnemy();   
    }

    void Update()
    {
        if (enemiesRemainingToSpawn > 0 && Time.time > nextSpawnTime)
        {
            enemiesRemainingToSpawn--;
            nextSpawnTime = Time.time + currentEnemy.timeBetweenSpawns;
            Enemy spawnedEnemy = Instantiate(enemy, Vector3.zero, Quaternion.identity) as Enemy;
            spawnedEnemy.startingHealth = currentEnemy.enemyHealth;
            spawnedEnemy.damage = currentEnemy.enemyDamage;
            spawnedEnemy.pathfinder.speed = currentEnemy.enemySpeed;
            spawnedEnemy.OnDeath += OnEnemyDeath;
        }
    }

    void OnEnemyDeath()
    {
        enemiesRemainingAlive--;

        if (enemiesRemainingAlive == 0)
        {
            NextEnemy();
        }
    }

    void NextEnemy()
    {
        currentEnemyNumber++;
        print("Wave: " + currentEnemyNumber);
        if (currentEnemyNumber - 1 < enemies.Length)
        {
            currentEnemy = enemies[currentEnemyNumber - 1];

            enemiesRemainingToSpawn = currentEnemy.enemyCount;
            enemiesRemainingAlive = enemiesRemainingToSpawn;
        }
    }


    [System.Serializable]
    public class Enemies
    {
        public int enemyCount;
        public float timeBetweenSpawns;
        public int enemyHealth;
        public int enemyDamage;
        public int enemySpeed;
    }
}
