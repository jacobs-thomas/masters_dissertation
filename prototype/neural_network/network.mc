import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

using Toybox.Application as App;
using Toybox.Activity as Activity;
using Toybox.System as Sys;


module Jacobs
{
    class PrioritisationNetwork
    {
        // Instance Attributes:
        hidden var mLayers as Array<Layer>;

        // Constructor:
        function initialize(layerSizes as Array<Lang.Integer>)
        {
            mLayers = [];

            for (var i = 0; i < layerSizes.size(); i++)
            {
                mLayers.add(new Layer(layerSizes[i+1], layerSizes[i]));
            }
        }

        // Method to perform forward propagation through the network
        function forward(inputs as Array<Lang.Float>) as Array<Lang.Float>
        {
            var outputs = inputs;
            for (var i = 0; i < mLayers.size(); i++)
            {
                outputs = mLayers[i].forward(outputs);
            }
            return outputs;
        }
    }
}