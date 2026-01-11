# Voice Denoising Using FIR Filtering (MATLAB)

This project implements a digital voice denoising system using frequency-domain analysis and FIR filtering techniques in MATLAB.

## Project Overview
A real voice sample corrupted by fan noise was recorded and analyzed using FFT. A high-order FIR band-stop filter was designed to remove noise frequencies and improve speech quality.

## Results
The Signal-to-Noise Ratio (SNR) improved from -20.44 dB to -14.52 dB after filtering, showing a significant enhancement in audio clarity.

## Tools
- MATLAB
- Digital Signal Processing (DSP)
- FIR Filter Design
- FFT Analysis

## Files
- `main.m` – MATLAB code for reading, filtering, and analyzing the audio  
- `voice_noisy.wav` – Original noisy audio  
- `voice_filtered.wav` – Output after filtering  
- `report.pdf` – Full technical report
