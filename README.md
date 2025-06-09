# Skeletonization-img-procs

## Methodology
### Preprocessing

* Convert the image to grayscale using rgb2gray().
* Binarize the grayscale image using imbinarize().
* Remove small noise using bwareaopen().

### Skeletonization Using Built-in Function
The bwmorph() function is used with 'skel' to thin the image iteratively until only the skeleton remains.
Additionally, the 'spur' operation from bwmorph() was applied to remove small spurious branches

### Custom Skeletonization: Zhang-Suen Algorithm
Implemented the Zhang-Suen thinning algorithm from scratch in MATLAB.
This algorithm iteratively removes edge pixels based on their neighborhood configuration while preserving object connectivity.

Key steps in each iteration:

* For each foreground pixel, extract the 8 neighbors in clockwise order.

* Check the number of non-zero neighbors (between 2 and 6).

* Check for exactly one 0→1 transition in the sequence.

* Apply additional mask conditions to preserve structure.

* This process is repeated until no further pixels can be removed.

## Results
Visual comparisons were made between the original binary image, and the result from bwmorph.
Another visual comparisons were made between the original binary image, and the custom implementation.
The built-in function provided fast, high-quality skeletons, while the Zhang-Suen method offered valuable insight into the morphological operations.
#### bwmorph
<img width="1680" alt="Screenshot 2025-06-09 at 21 56 37" src="https://github.com/user-attachments/assets/9573863f-551b-4199-a1a5-5394e14dcd9b" />

#### Zhang-Suen Algorithm
<img width="1680" alt="Screenshot 2025-06-09 at 21 57 53" src="https://github.com/user-attachments/assets/264f6d66-3b5e-4014-bfc1-e28023bf09df" />

#### bwmorph
<img width="1680" alt="Screenshot 2025-06-09 at 21 59 27" src="https://github.com/user-attachments/assets/efbaa5f3-fbd1-46f7-b542-d51ed9e04d1d" />

#### Zhang-Suen Algorithm
<img width="1680" alt="Screenshot 2025-06-09 at 21 59 39" src="https://github.com/user-attachments/assets/560a2f49-2c29-409d-882a-d1c27c5b0890" />

#### bwmorph
<img width="1680" alt="Screenshot 2025-06-09 at 22 00 20" src="https://github.com/user-attachments/assets/94bf0a23-ce1f-4fb4-9c60-1694c73ba9bd" />

#### Zhang-Suen Algorithm
<img width="1680" alt="Screenshot 2025-06-09 at 22 00 31" src="https://github.com/user-attachments/assets/8c649bc6-88de-45d8-8d64-79ee231bfdc4" />

#### bwmorph
<img width="1680" alt="Screenshot 2025-06-09 at 22 01 13" src="https://github.com/user-attachments/assets/e0745217-a001-45ff-9caa-951a15fa75b6" />

#### Zhang-Suen Algorithm
<img width="1680" alt="Screenshot 2025-06-09 at 22 01 21" src="https://github.com/user-attachments/assets/c40ad09e-bf1f-43f8-96b8-50419a640972" />

#### bwmorph
<img width="1680" alt="Screenshot 2025-06-09 at 22 02 22" src="https://github.com/user-attachments/assets/06de589e-2ff8-42a8-a930-39705308bca8" />

#### Zhang-Suen Algorithm
<img width="1680" alt="Screenshot 2025-06-09 at 22 02 30" src="https://github.com/user-attachments/assets/be06b68b-386f-45e6-8653-a5ed481f7b64" />

## References
* MATLAB Documentation: https://www.mathworks.com/help/images/ref/bwmorph.html
* Zhang, T. Y., & Suen, C. Y. (1984). A fast parallel algorithm for thinning digital patterns. Communications of the ACM, 27(3), 236–239.
