using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class Car : MonoBehaviour
{
    float speed = 0;
    void Start()
    {
        
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        if (Input.GetKey(KeyCode.W)) speed = Mathf.Clamp(speed + Time.deltaTime * 0.1f, 0, 0.4f);
        else speed = Mathf.Clamp(speed - Time.deltaTime / 5, 0, 100);

        if (Input.GetKey(KeyCode.D))
        {
            transform.Rotate(0, 90 * Time.deltaTime, 0);
            GetComponent<Renderer>().material.SetTextureOffset("_MainTex", new Vector2(0.50f, 0));
        }
        else if (Input.GetKey(KeyCode.A)) {
            transform.Rotate(0, -90 * Time.deltaTime, 0);
            GetComponent<Renderer>().material.SetTextureOffset("_MainTex", new Vector2(0.75f, 0));
        }
        else GetComponent<Renderer>().material.SetTextureOffset("_MainTex", new Vector2(0, 0));

        transform.position += transform.forward * speed;

    }
}
