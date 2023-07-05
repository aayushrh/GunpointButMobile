using Unity.Netcode;
using UnityEngine;

public class GameManager : NetworkBehaviour {
    [SerializeField] private PlayerController _playerPrefab;
    [SerializeField] private GameObject _enemyPrefab;

    public override void OnNetworkSpawn() {
        Debug.Log("Spawn");
        SpawnPlayerServerRpc(NetworkManager.Singleton.LocalClientId);
    }   

    [ServerRpc(RequireOwnership = false)]
    private void SpawnPlayerServerRpc(ulong playerId) {
        var spawn = Instantiate(_playerPrefab);
        spawn.NetworkObject.SpawnWithOwnership(playerId);
    }

    [ServerRpc(RequireOwnership = false)]
    private void SpawnEnemyServerRpc(Vector3 loc) {
        var spawn = Instantiate(_enemyPrefab, loc, Quaternion.identity);
        spawn.GetComponent<NetworkObject>().Spawn();
    }

    void Update(){
        var num = Random.Range(0, 100);
        if (num == 1 && IsServer){
            SpawnEnemyServerRpc(new Vector3(Random.Range(-17, 17), 0, 9));
        }
    }

    public override void OnDestroy() {
        base.OnDestroy();
        MatchmakingService.LeaveLobby();
        if(NetworkManager.Singleton != null )NetworkManager.Singleton.Shutdown();
    }
}