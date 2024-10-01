import { useEffect, useState } from 'react';
import Drawer from '@mui/material/Drawer';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import IconButton from '@mui/material/IconButton';
import InputBase from '@mui/material/InputBase';
import classnames from 'classnames';
import { useEditor, EditorContent } from '@tiptap/react';
import { StarterKit } from '@tiptap/starter-kit';
import { Underline } from '@tiptap/extension-underline';
import { Placeholder } from '@tiptap/extension-placeholder';
import { TextAlign } from '@tiptap/extension-text-align';
import CustomIconButton from '@core/components/mui/IconButton';
import { useSettings } from '@core/hooks/useSettings';
import '@/libs/styles/tiptapEditor.css';
import apiClient from '@/utils/apiClient';
import { signOut } from 'next-auth/react';
import { responseData } from '@/utils/message';
import Loader from '@/components/loader';
import { showToast } from '@/utils/helper';
import Radio from '@mui/material/Radio';
import RadioGroup from '@mui/material/RadioGroup';
import FormControlLabel from '@mui/material/FormControlLabel';
import FormControl from '@mui/material/FormControl';
import FormLabel from '@mui/material/FormLabel';

const EditorToolbar = ({ editor }) => {
    if (!editor) {
        return null
    }

    return (
        <div className='flex flex-wrap gap-x-3 gap-y-1 plb-2 pli-4 border-bs'>
            <CustomIconButton
                {...(editor.isActive('bold') && { color: 'primary' })}
                variant='tonal'
                size='small'
                onClick={() => editor.chain().focus().toggleBold().run()}
            >
                <i className={classnames('bx-bold', { 'text-textSecondary': !editor.isActive('bold') })} />
            </CustomIconButton>
            <CustomIconButton
                {...(editor.isActive('underline') && { color: 'primary' })}
                variant='tonal'
                size='small'
                onClick={() => editor.chain().focus().toggleUnderline().run()}
            >
                <i className={classnames('bx-underline', { 'text-textSecondary': !editor.isActive('underline') })} />
            </CustomIconButton>
            <CustomIconButton
                {...(editor.isActive('italic') && { color: 'primary' })}
                variant='tonal'
                size='small'
                onClick={() => editor.chain().focus().toggleItalic().run()}
            >
                <i className={classnames('bx-italic', { 'text-textSecondary': !editor.isActive('italic') })} />
            </CustomIconButton>
            <CustomIconButton
                {...(editor.isActive('strike') && { color: 'primary' })}
                variant='tonal'
                size='small'
                onClick={() => editor.chain().focus().toggleStrike().run()}
            >
                <i className={classnames('bx-strikethrough', { 'text-textSecondary': !editor.isActive('strike') })} />
            </CustomIconButton>
            <CustomIconButton
                {...(editor.isActive({ textAlign: 'left' }) && { color: 'primary' })}
                variant='tonal'
                size='small'
                onClick={() => editor.chain().focus().setTextAlign('left').run()}
            >
                <i className={classnames('bx-align-left', { 'text-textSecondary': !editor.isActive({ textAlign: 'left' }) })} />
            </CustomIconButton>
            <CustomIconButton
                {...(editor.isActive({ textAlign: 'center' }) && { color: 'primary' })}
                variant='tonal'
                size='small'
                onClick={() => editor.chain().focus().setTextAlign('center').run()}
            >
                <i
                    className={classnames('bx-align-middle', {
                        'text-textSecondary': !editor.isActive({ textAlign: 'center' })
                    })}
                />
            </CustomIconButton>
            <CustomIconButton
                {...(editor.isActive({ textAlign: 'right' }) && { color: 'primary' })}
                variant='tonal'
                size='small'
                onClick={() => editor.chain().focus().setTextAlign('right').run()}
            >
                <i
                    className={classnames('bx-align-right', {
                        'text-textSecondary': !editor.isActive({ textAlign: 'right' })
                    })}
                />
            </CustomIconButton>
            <CustomIconButton
                {...(editor.isActive({ textAlign: 'justify' }) && { color: 'primary' })}
                variant='tonal'
                size='small'
                onClick={() => editor.chain().focus().setTextAlign('justify').run()}
            >
                <i
                    className={classnames('bx-align-justify', {
                        'text-textSecondary': !editor.isActive({ textAlign: 'justify' })
                    })}
                />
            </CustomIconButton>
        </div>
    )
}

const ComposeMail = props => {
    const { openCompose, setOpenCompose, isBelowSmScreen, isBelowMdScreen } = props;
    const { settings } = useSettings();
    const [to, setTo] = useState('');
    const [subject, setSubject] = useState('');
    const [visibility, setVisibility] = useState({ cc: false, bcc: false });
    const [apiErrors, setApiErrors] = useState({});
    const [isButtonLoading, setIsButtonLoading] = useState(false);
    const [recipientType, setRecipientType] = useState('single-user');

    const toggleVisibility = value => {
        setVisibility(prev => ({ ...prev, [value]: !prev[value] }));
    };

    const editor = useEditor({
        extensions: [
            StarterKit,
            Placeholder.configure({
                placeholder: 'Message',
            }),
            TextAlign.configure({
                types: ['heading', 'paragraph'],
            }),
            Underline,
        ],
        immediatelyRender: false,
    });

    const handleRecipientTypeChange = (event) => {
        setRecipientType(event.target.value);
    };

    const handleSend = async () => {
        setIsButtonLoading(true);
        const message = editor.getHTML();
        const postData = {
            to: to ?? '',
            subject: subject ?? '',
            message: message ?? '',
            sendMailTo: recipientType
        };
        try {
            const response = await apiClient.post('/api/email', postData);
            if (response.data.result === true) {
                setApiErrors({});
                showToast(true, response.data.message);
                setIsButtonLoading(false);
                setOpenCompose(false);
            } else if (response.data.result === false) {
                if (response?.data?.message?.roleError?.name === responseData.tokenExpired || response?.data?.message?.invalidToken === responseData.invalidToken) {
                    await signOut({ callbackUrl: process.env.NEXT_PUBLIC_APP_URL });
                    sessionStorage.removeItem("token");
                    setIsButtonLoading(false);
                } else {
                    if (response?.data?.message) {
                        setApiErrors(response?.data?.message);
                    } else {
                        setApiErrors({ error: response?.data?.error });
                    }
                    setIsButtonLoading(false);
                }
            }
        } catch (error) {
            console.error('Error sending email:', error);
        }
    };

    useEffect(() => {
        if (openCompose === true) {
            setTo('');
            setSubject('');
            if (editor) {
                editor.commands.clearContent();
            }
            setApiErrors({});
        }
    }, [openCompose, editor])

    return (
        <Drawer
            anchor='bottom'
            variant='persistent'
            hideBackdrop
            open={openCompose}
            onClose={() => setOpenCompose(false)}
            PaperProps={{
                sx: {
                    width: isBelowMdScreen ? 'calc(100% - 2 * 1.5rem)' : '100%',
                    maxWidth: 600,
                    position: 'absolute',
                    height: 'auto',
                    insetInlineStart: 'auto',
                    insetInlineEnd: '1.5rem',
                    insetBlockEnd: '1.5rem',
                    borderRadius: 'var(--mui-shape-borderRadius)',
                    borderTop: 0,
                    boxShadow: settings.skin === 'bordered' ? 'none' : 'var(--mui-customShadows-xl)',
                    border: settings.skin === 'bordered' ? '1px solid var(--mui-palette-divider)' : undefined,
                    zIndex: 12,
                },
            }}
        >
            <div className='flex items-center justify-between plb-3 pli-6 bg-actionHover'>
                <Typography variant='h5' color='text.secondary'>Compose Mail</Typography>
                <div className='flex gap-2'>
                    <IconButton size='small' onClick={() => setOpenCompose(false)}><i className='bx-minus text-textSecondary' /></IconButton>
                    <IconButton size='small' onClick={() => setOpenCompose(false)}><i className='bx-x text-textSecondary' /></IconButton>
                </div>
            </div>

            {apiErrors?.error && (
                <div className='plb-3 pli-6'>
                    <Typography variant="body2" color="error" className="mt-1">{apiErrors.error}</Typography>
                </div>
            )}

            {/* Radio buttons for recipient type */}
            <div className='plb-3 pli-6'>
                <FormControl component="fieldset">
                    <div className="flex items-center">
                        <FormLabel component="legend" className="mr-3">Send mail to :</FormLabel>
                        <RadioGroup row value={recipientType} onChange={handleRecipientTypeChange}>
                            <FormControlLabel value="all-users" control={<Radio />} label="All Users" />
                            <FormControlLabel value="single-user" control={<Radio />} label="Single User" />
                        </RadioGroup>
                    </div>
                </FormControl>
            </div>



            {/* Conditionally display "To" input field */}
            {recipientType === 'single-user' && (
                <div className='flex items-center gap-2 pli-6 plb-1'>
                    <Typography className='font-medium' color='text.disabled'>To:</Typography>
                    <InputBase fullWidth value={to} onChange={e => setTo(e.target.value)} />
                    {apiErrors?.to && (
                        <Typography variant="body2" color="error" className="mt-1">{apiErrors.to}</Typography> // Display error message
                    )}
                </div>
            )}

            <InputBase
                className='plb-1 pli-6 border-bs'
                startAdornment={<Typography className='font-medium mie-2' color='text.disabled'>Subject:</Typography>}
                value={subject}
                onChange={e => setSubject(e.target.value)}
            />

            <EditorToolbar editor={editor} />
            <EditorContent editor={editor} className='bs-[105px] overflow-y-auto flex border-bs' />

            <div className='plb-4 pli-6 flex justify-between items-center gap-4'>
                <div className='flex items-center gap-4 max-sm:gap-3'>
                    {isBelowSmScreen ? (
                        <CustomIconButton color='primary' variant='contained' onClick={handleSend}><i className='bx-send' /></CustomIconButton>
                    ) : (
                        <Button variant='contained' endIcon={isButtonLoading ? '' : <i className='bx-send' />} onClick={handleSend} disabled={isButtonLoading}>{isButtonLoading ? <Loader type="btnLoader" /> : 'Send'}</Button>
                    )}
                    {/* <IconButton size='small'><i className='bx-paperclip text-textSecondary' /></IconButton> */}
                </div>
                {/* <div className='flex gap-2'>
                    <IconButton size='small'><i className='bx-dots-vertical-rounded text-textSecondary' /></IconButton>
                    <IconButton size='small' onClick={() => setOpenCompose(false)}><i className='bx-trash text-textSecondary' /></IconButton>
                </div> */}
            </div>
        </Drawer>
    );
};

export default ComposeMail;
