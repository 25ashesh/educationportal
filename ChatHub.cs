﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace educationportal.com
{
    public class ChatHub:Hub
    {
        public void Send(string name, string message)
        {
            //call the broadcastMessage method to update clients
            Clients.All.broadCastMessage(name,message);

        }

    }
}