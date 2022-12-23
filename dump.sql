PGDMP         ;                z            shortly #   14.5 (Ubuntu 14.5-0ubuntu0.22.04.1) #   14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24706    shortly    DATABASE     \   CREATE DATABASE shortly WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'pt_BR.UTF-8';
    DROP DATABASE shortly;
                postgres    false            �            1259    24756    sessions    TABLE     �   CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);
    DROP TABLE public.sessions;
       public         heap    postgres    false            �            1259    24755    sessions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sessions_id_seq;
       public          postgres    false    212            �           0    0    sessions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;
          public          postgres    false    211            �            1259    24771    urls    TABLE     �   CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "userId" integer NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);
    DROP TABLE public.urls;
       public         heap    postgres    false            �            1259    24770    urls_id_seq    SEQUENCE     �   CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.urls_id_seq;
       public          postgres    false    214            �           0    0    urls_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;
          public          postgres    false    213            �            1259    24744    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24743    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    210            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    209                       2604    24759    sessions id    DEFAULT     j   ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);
 :   ALTER TABLE public.sessions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212                       2604    24774    urls id    DEFAULT     b   ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);
 6   ALTER TABLE public.urls ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214                       2604    24747    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            �          0    24756    sessions 
   TABLE DATA           D   COPY public.sessions (id, token, "userId", "createdAt") FROM stdin;
    public          postgres    false    212   �       �          0    24771    urls 
   TABLE DATA           X   COPY public.urls (id, url, "shortUrl", "userId", "visitCount", "createdAt") FROM stdin;
    public          postgres    false    214   �       �          0    24744    users 
   TABLE DATA           G   COPY public.users (id, name, email, password, "createdAt") FROM stdin;
    public          postgres    false    210   �%       �           0    0    sessions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sessions_id_seq', 13, true);
          public          postgres    false    211            �           0    0    urls_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.urls_id_seq', 23, true);
          public          postgres    false    213            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 15, true);
          public          postgres    false    209                       2606    24764    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            postgres    false    212                       2606    24780    urls urls_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.urls DROP CONSTRAINT urls_pkey;
       public            postgres    false    214                       2606    24754    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    210                       2606    24752    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    210                       2606    24765    sessions sessions_userId_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);
 I   ALTER TABLE ONLY public.sessions DROP CONSTRAINT "sessions_userId_fkey";
       public          postgres    false    212    3351    210                       2606    24781    urls urls_userId_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);
 A   ALTER TABLE ONLY public.urls DROP CONSTRAINT "urls_userId_fkey";
       public          postgres    false    3351    210    214            �   �  x�e�ɑ%1Dϒ� lP��E��&�41�#8J�$3�li��5��.(ð� g�@D牅
#3�˛C�ps4�\h�5�dxl�c:��EޅG��!z�O�ު"7�6�[P�:��8��Ա�o��Ohg��ET��{`+�Z@�~ͭ�ſ�������r�*�x�ݼ!�eX�u
r�����e~����^n�6�@��c��觃2���]��oFN{:�3U+���b,��%t�b�%z��B��_�G���%���6j��<���d�S�3!��W���ʽ��s���	!A��etz�WV6D� ����I���h�W˿�At
����l����B���8L+QY'�f�3��<O�2��|\��WV雒5�ǝݢ��9�	���πAI�wL�31�Jj����"tÖZ���n8���Kj9 3��ת����D:���?O��/�)�#      �   ;  x��W[s�6~�E_�i�X��3�� ��B�Lga#�-�/��{d�$�m7��΀d���H�9�9�EYfE��d�^�	�سHy\�gf21g��-�͛ѕ�iH���&� Ԡ~�:&q\�&:9�Jy9��F�h36��jTh�f�E��Z����(�3Y�W�9�}�=�Mߧ�:=\�XP�B;�!�ը�>F��
L�֝��g�� }��>_~�4,״= @�{ PI��;�Ib?�w�����M�-�"�;@i��b�����~�D�F3�if2��RD�=]V왋\�4R���8cy��X��t!�=����,>��W��c�ב����۵3_s�`�e5l�t���:��dZ�9��Ѫ��v�?ơ��=��#|�iՌ���Af���y�jX��"����A")���;,�ݿCW��i��i�.�`��F�xy�*x�*xZ�/���C<��|�#g����Π���nhsJ��L��}p}N6�x;�&��/�8�ވe��W�{k�=��<���p�(eΡg���!x��ხ�H[�Hʒ@���LD,�Yd�\2Y�#�,bx-+�gw0��`<:.g�OGAr�M{춼s.��xy�0[�/:k�BW�(k{����z�:�������6��Ѹ߼k��[�ǡ L~�W�jU�Z����)E�xQ�_Oe
K�2�ӄ�?9���m,�m���`�m�0�1������@<L�/-�����!���"K�EMxƂ��I�R)B�U\�$8gNɗw�w������ajfb�f@��l!K	=����BC����P݋�LB]ǲ�tj{��̢��!|	� ���C
��`� a�i�@�$j��7���ø���!�K?�Ɏ���*>5�W���>�}�s[v���E�^*�]��`?�^������������F���:�Nl�>�$,�3%+E`��A>��B�x�(�{	YTq}�L�NQ�h=�pk�vj��9�d^U\�D@�4 c��9ـ�l!/Jn� ��j!�1-���+�c��2Y�J�=	7rґ2jf�u�!�s����&�Oo��q��?!��ȁ�ç~����8R� Y��e}R�����Q��'��5�R�O��{��g<bǹ������U�C�J�0�=6���.0�#�cVA�׊����6 �v)�m�G3�Y7 �5�v�GphIi��g�����BƯA=Μ�������Ou�e��}���Y:m��^7�R^�H�DP�͠m�/��᫠F��ql��Ú��+H��J��9O���R������sm���w�j��7]�� C��������9'+͵X��Cp�2�N��9�����َ�6Ð%��׺p�MKƽ^�q�Ӡ�Fo+Td��v���::<PU��9�f��.�;�:�ݢQS�ڞ�����欹�,��2�G��,Z�n�t��x���h9�|��Զw3 ���p5�)W��(����U�
%r�܀��s��)�w|�	q�s�a-ʯn�'�j秭V3z��ˋ�n1�����:�yu$8���Y4�3Y��\���:����?M]��*��      �     x�u�I��F�uq�^�m�������'�����@���t�>�/f�s8l������D`Z��i�U��ure%�|`����rɟ�(徿��+�_�����4�`㯛EĜ˺�f6&�� �1���w��aA�*RHe��"G���r��@���v+���(Bh��%0.z��yٝ5G\k���\�R~�?'�XYX�G�1�o�Q���T�(0�:�|�{um���m�5��8�R)��n]�2�U��^K���V[��f0���y�HD�d0J�3�{u�^B�t�T�C��ǺE������͵�6���B|�a�\�eW�"J<V�)`����@�U��>_�4���i��d�t�Ӥ1��l'}b͢B�����Zjg��ˮT�
$�yT�C<������+ä<���5A#ϻΝ�q�Oi�:��?��V�k�E3oD���	�U���X�U�!���
�0��|֞ �����qc�r������ÄUr\��F���q��^i�������_uQ���,P���4O��<?뽚:]`(i�6��wH��/������Q]�G����j='���(���@ F�	���X�g�'��̈Sd��,�����ە5��{ŵ]���U����h��+)�dJ��]�@���d���k�~"O;w���bau�rx���rrM��X���i����8^e�ݯ��"���qH��N�_��ݰGulN���|ă���3��R�y���.���	7�H������{e����9���X}�     