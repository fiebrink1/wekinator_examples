using UnityEngine;
using System.Collections;
using System.Collections.Generic;


/// <summary>
/// Simple OSC test communication script
/// </summary>
[AddComponentMenu("Scripts/OSCTestSender")]
public class OSCTestSender : MonoBehaviour
{

    private Osc oscHandler;

    public string remoteIp;
    public int sendToPort;
    public int listenerPort;


    ~OSCTestSender()
    {
        if (oscHandler != null)
        {            
            oscHandler.Cancel();
        }

        // speed up finalization
        oscHandler = null;
        System.GC.Collect();
    }

    /// <summary>
    /// Update is called every frame, if the MonoBehaviour is enabled.
    /// </summary>
    void Update()
    {
        //Debug.LogWarning("time = " + Time.time);
       
        OscMessage oscM = Osc.StringToOscMessage("/test1 TRUE 23 0.501 bla");
        oscHandler.Send(oscM);  
    }

    /// <summary>
    /// Awake is called when the script instance is being loaded.
    /// </summary>
    void Awake()
    {
       
    }

    void OnDisable()
    {
        // close OSC UDP socket
        Debug.Log("closing OSC UDP socket in OnDisable");
        oscHandler.Cancel();
        oscHandler = null;
    }

    /// <summary>
    /// Start is called just before any of the Update methods is called the first time.
    /// </summary>
    void Start()
    {
        
        UDPPacketIO udp = GetComponent<UDPPacketIO>();
        udp.init(remoteIp, sendToPort, listenerPort);
        
	    oscHandler = GetComponent<Osc>();
        oscHandler.init(udp);
        
        oscHandler.SetAddressHandler("/hand1", Example);
    }

    public static void Example(OscMessage m)
    {
        Debug.Log("--------------> OSC example message received: ("+m+")");
    }



}
