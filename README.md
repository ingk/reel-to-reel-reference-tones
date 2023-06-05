<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>

# Reel to Reel Reference Tones

## About The Project

This is a project to provide reference tones used for reel to reel audio tapes. By using reference tones 
you can (re)calibrate a reel to reel tape recorder correctly for playback. This is especially useful when a 
tape gets played on a machine that is not the machine it was recorded on. Your friends and mastering engineers 
will appreciate it.

## Getting Started

If you just want to download the reference tones, you can check out the latest release.

### Prerequisites

To build the reference tones yourself, you only need [sox](https://sox.sourceforge.net) installed.

### Installation

1. On a Mac you can run `make bootstrap-build-mac` to install the dependency.
2. Then `make` will generate the audio files inside the `output` directory
   1. The directory will include all reference tones in separate file
   2. There is also a combined/ready to use `reference.wav`

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.