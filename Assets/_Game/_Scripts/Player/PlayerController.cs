using Unity.Netcode;
using UnityEngine;

public class PlayerController : NetworkBehaviour {
    [SerializeField] private float _speed = 3;
    private Rigidbody _rb;
    [SerializeField]private ulong move;

    private void Awake() {
        _rb = GetComponent<Rigidbody>();
    }

    private void Update() {
        if ( move != 0){
            var dir = new Vector3(Input.GetAxisRaw("Horizontal"), 0, Input.GetAxisRaw("Vertical"));
            _rb.velocity = dir * _speed;
        }
    }

    public override void OnNetworkSpawn() {
        if (!IsOwner) Destroy(this);
    }
}